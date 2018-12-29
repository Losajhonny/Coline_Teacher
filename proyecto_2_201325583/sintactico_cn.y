%{
#include "scanner.h"
#include "nodo.h"
#include <iostream>
#include <QString>

extern int yylineno;
extern int columna;
extern char *yytext;

Nodo *raiz;

void yyerror(const char *mens);
Nodo * getRaiz();
%}

%error-verbose

%union
{
int INTEGER;
char TEXT [256];
struct Nodo *NODE;
}

//TERMINALES
%token tk_mas
%token tk_menos
%token tk_por
%token tk_div
%token tk_pot

%token pari
%token pard
%token llai
%token llad

%token dospuntos
%token igual
%token ptcoma

%token pr_selecciona
%token pr_caso
%token pr_default

%token<TEXT> pr_mientras
%token<TEXT> pr_hacer
%token<TEXT> pr_para

%token<TEXT> pr_entero
%token<TEXT> pr_decimal
%token<TEXT> pr_booleano
%token<TEXT> pr_caracter
%token<TEXT> pr_cadena
%token pr_vacio
%token<TEXT> pr_imprimir

%token<TEXT> pr_verdadero
%token<TEXT> pr_falso
%token<TEXT> entero
%token<TEXT> decimal
%token<TEXT> caracter
%token<TEXT> cadena
%token<TEXT> id


//NO TERMINALES
%type<NODE> S
%type<NODE> EXP
%type<NODE> ASIGNACION
%type<NODE> DECLARACION
%type<NODE> TIPO_DATO
%type<NODE> MIENTRAS
%type<NODE> HACER
//%type<NODE> PARA


%type<NODE> IMPRIMIR
%type<NODE> INSTRUCCIONES
%type<NODE> INSTS
%type<NODE> INST

//%type<INTEGER> TIPO_RETORNO

%left tk_mas tk_menos
%left tk_por tk_div
%right tk_pot

%start S
%%

S: INSTRUCCIONES   {raiz = $1;}
;

/****************************INSTRUCCIONES*************************/
INSTRUCCIONES: INSTS    {$$=$1;}
|                       {$$=NULL;}
;

INSTS: INST
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CINSTRUCCIONES;
    n->hijos.push_back($1);
    $$=n;
}
|   INSTS INST
{
    Nodo *n = $1;
    n->hijos.push_back($2);
    $$=n;
}
;

INST: DECLARACION ptcoma       {$$=$1;}
| ASIGNACION ptcoma            {$$=$1;}
| IMPRIMIR ptcoma              {$$=$1;}
| HACER ptcoma                 {$$=$1;}
| MIENTRAS                     {$$=$1;}
;

/**************************HACER**********************************/
HACER: pr_hacer llai INSTRUCCIONES llad  pr_mientras pari EXP pard
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CHACER;
    n->instrucciones = $3;
    n->expresion = $7;
    n->line = yylineno;
    n->colm = yyleng;
    $$ = n;
}
;




/******************************MIENTRAS***************************/
MIENTRAS: pr_mientras pari EXP pard llai INSTRUCCIONES llad
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CMIENTRAS;
    n->expresion = $3;
    n->instrucciones = $6;
    n->line = yylineno;
    n->colm = yyleng;
    $$ = n;
}
;



/*****************************IMPRIMIR****************************/
IMPRIMIR: pr_imprimir pari EXP pard
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CIMPRIMIR;
    n->expresion = $3;
    n->line = yylineno;
    n->colm = yyleng;
    $$=n;
}
;


//



/***************************DECLARACIONES***************************/
DECLARACION: TIPO_DATO id igual EXP
{
    Nodo *n = new Nodo();
    Nodo *t = $1;
    n->tipo_nodo = CDECLARACION;        /*TIPO_NODO*/
    n->tipo_datoc = t->valor;           /*Tipo de dato en cadena por motivos de que talvez sea un id y no se sabe que nombre es ese id*/
    n->valor = $2;                      /*valor guarda el id*/
    n->expresion = $4;                  /*expresion almacena el valor del id*/
    n->line = yylineno;
    n->colm = yyleng;
    $$ = n;
}
| TIPO_DATO id
{
    Nodo *n = new Nodo();
    Nodo *t = $1;
    n->tipo_nodo = CDECLARACION;        /*TIPO_NODO*/
    n->tipo_datoc = t->valor;           /*Tipo de dato en cadena por motivos de que talvez sea un id y no se sabe que nombre es ese id*/
    n->valor = $2;                      /*valor guarda el id*/
    n->expresion = NULL;                  /*expresion almacena el valor del id*/
    n->line = yylineno;
    n->colm = yyleng;
    $$ = n;
}
;




/****************************ASIGNACIONES****************************/
ASIGNACION: id igual EXP
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CASIGNACION;
    n->valor = $1;
    n->expresion = $3;
    n->line = yylineno;
    n->colm = yyget_leng();
    $$ = n;
}
;



/*******************************TIPO DE DATO**************************/
TIPO_DATO: pr_entero    {Nodo *n = new Nodo(); n->valor=$1; $$=n;}
| pr_decimal            {Nodo *n = new Nodo(); n->valor=$1; $$=n;}
| pr_booleano           {Nodo *n = new Nodo(); n->valor=$1; $$=n;}
| pr_caracter           {Nodo *n = new Nodo(); n->valor=$1; $$=n;}
| pr_cadena             {Nodo *n = new Nodo(); n->valor=$1; $$=n;}
| id                    {Nodo *n = new Nodo(); n->valor=$1; $$=n;}
;


/*******************************EXPRESIONES****************************/

EXP: EXP tk_mas EXP
{
    Nodo *n = new Nodo();
    n->tipo_nodo = MAS;
    n->izq = $1;
    n->der = $3;
    n->line = yylineno;
    n->colm = yyget_leng();
    $$ = n;
}
|   EXP tk_menos EXP
{
    Nodo *n = new Nodo();
    n->tipo_nodo = MENOS;
    n->izq = $1;
    n->der = $3;
    n->line = yylineno;
    n->colm = yyget_leng();
    $$ = n;
}
|   EXP tk_por EXP
{
    Nodo *n = new Nodo();
    n->tipo_nodo = POR;
    n->izq = $1;
    n->der = $3;
    n->line = yylineno;
    n->colm = yyget_leng();
    $$ = n;
}
|   EXP tk_div EXP
{
    Nodo *n = new Nodo();
    n->tipo_nodo = DIV;
    n->izq = $1;
    n->der = $3;
    n->line = yylineno;
    n->colm = yyget_leng();
    $$ = n;
}
|   EXP tk_pot EXP
{
    Nodo *n = new Nodo();
    n->tipo_nodo = POT;
    n->izq = $1;
    n->der = $3;
    n->line = yylineno;
    n->colm = yyget_leng();
    $$ = n;
}
|   pr_verdadero
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CPRIMITIVO;
    n->line = yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = BOOLEANO;
    $$ = n;
}
|   pr_falso
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CPRIMITIVO;
    n->line = yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = BOOLEANO;
    $$ = n;
}
|   entero
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CPRIMITIVO;
    n->line = yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = ENTERO;
    $$ = n;
}
|   decimal
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CPRIMITIVO;
    n->line = yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = DECIMAL;
    $$ = n;
}
|   caracter
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CPRIMITIVO;
    n->line =yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = CARACTER;
    $$ = n;
}
|   cadena
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CPRIMITIVO;
    n->line = yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = CADENA;
    $$ = n;
}
|   id
{
    Nodo *n = new Nodo();
    n->tipo_nodo = CVARIABLE;
    n->line = yylineno;
    n->colm = yyget_leng();
    n->valor = $1;
    n->tipo_dato = ID;
    $$ = n;
}
;



%%

void yyerror(const char* mens){
    std::cout << "Linea: " << yylineno << std::endl;
    std::cout << mens << " " << yytext << std::endl;
    //return 0;
}

Nodo * getRaiz(){
    return raiz;
}
