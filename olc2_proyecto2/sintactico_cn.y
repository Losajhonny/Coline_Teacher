%{
#include "scanner.h"
#include <iostream>
#include <QString>

extern int yylineno;
extern int columna;
extern char *yytext;
void yyerror(const char *mens);
%}

%error-verbose

//Terminales
%token caracter_nulo
%token pr_entero
%token pr_decimal
%token pr_caracter
%token pr_cadena
%token pr_booleano

%token pr_nada
%token pr_tamanio
%token pr_concatenar
%token pr_convertiracadena
%token pr_convertiraentero
%token pr_clase
%token pr_este
%token pr_publico
%token pr_protegido
%token pr_privado
%token pr_hereda_de
%token pr_sobrescribir
%token pr_principal
%token pr_importar
%token pr_nuevo
%token pr_vacio

%token pr_imprimir
%token pr_detener
%token pr_continuar
%token pr_retornar
%token pr_si
%token pr_sino
%token pr_selecciona
%token pr_caso
%token pr_default
%token pr_mientras
%token pr_hacer
%token pr_para

%token pr_lista
%token pr_insertar
%token pr_obtener
%token pr_buscar
%token pr_pila
%token pr_apilar
%token pr_desapilar
%token pr_cola
%token pr_encolar
%token pr_desencolar
%token pr_mostraredd
%token pr_leerteclado

%token pr_verdadero
%token pr_falso

%token entero
%token decimal
%token caracter
%token cadena
%token id

%token pari
%token pard
%token cori
%token cord
%token llai
%token llad

%token ptcoma
%token dospuntos
%token punto
%token coma
%token interr

%token tk_igual
%token tk_masigual
%token tk_menigual
%token tk_porigual
%token tk_divigual

%token tk_mas
%token tk_menos
%token tk_por
%token tk_div
%token tk_pot
%token tk_masmas
%token tk_menmen

%token tk_mayor
%token tk_menor
%token tk_mayorigual
%token tk_menorigual
%token tk_igualigual
%token tk_diferente

%token tk_or
%token tk_and
%token tk_not

%left tk_mas tk_menos
%left tk_por tk_div
%precedence NEG
%right tk_pot
%left tk_masmas tk_menmen

%left tk_mayor tk_menor tk_mayorigual tk_menorigual tk_igualigual tk_diferente
%left tk_or
%left tk_and
%right tk_not

%left pr_retornar

%start S
%%

S: IMPORTACIONES CLASE;

/*IMPORTACIONES*/
IMPORTACIONES: IMPORTS
|
;

IMPORTS: IMPORTS IMPORTACION
| IMPORTACION;

IMPORTACION: pr_importar pari EXP pard ptcoma;

/*CLASE Y HERENCIA*/

CLASE: VISIBILIDAD pr_clase id HERENCIA llai FUNCIONES llad;

HERENCIA: pr_hereda_de id
|
;

/***************************FUNCIONES DE UNA CLASE********************************/
FUNCIONES: FUNS
|
;

FUNS: FUNS FUN
| FUN;

FUN: PRINCIPAL
| CONSTRUCTOR
| METODO
| ATRIBUTO ptcoma
;

/********************************ATRIBUTOS***************************************/
ATRIBUTO: VISIBILIDAD DECLARACION;

/*******************************CONSTRUCTOR**************************************/
CONSTRUCTOR: VISIBILIDAD id pari PARAMETROS pard llai INSTRUCCIONES llad;

/******************************METODO PRINCIPAL**********************************/
PRINCIPAL: pr_principal pari pard llai INSTRUCCIONES llad;

/**********************************METODO****************************************/
METODO: VISIBILIDAD TIPO_RETORNO id pari PARAMETROS pard llai INSTRUCCIONES llad
| pr_sobrescribir VISIBILIDAD TIPO_RETORNO id pari PARAMETROS pard llai INSTRUCCIONES llad;

/**********************************PARAMETROS************************************/
PARAMETROS: PARAMS
|
;

PARAMS: PARAMS coma PARAM
| PARAM
;

PARAM: TIPO_DATO id
| TIPO_DATO id DIMENSIONES
;

/***************************************VISIBILIDAD********************************/
VISIBILIDAD: pr_privado
| pr_publico
| pr_protegido
|
;


/****************************************INSTRUCCIONES******************************/
INSTRUCCIONES: INSTS
|
;

INSTS: INSTS INST
| INST
;

INST: DECLARACION ptcoma
| ASIGNACION ptcoma
| IMPRIMIR ptcoma
| DETENER ptcoma
| CONTINUAR ptcoma
| RETORNAR ptcoma
| CONCATENAR ptcoma
| HACER ptcoma
| MIENTRAS
| PARA
| SI
| SELECCIONA
;

/***************************************IMPRIMIR************************************/
IMPRIMIR: pr_imprimir pari EXP pard;

/***************************************CONCATENACION*******************************/
CONCATENAR: pr_concatenar pari EXP coma EXP pard
| pr_concatenar pari EXP coma EXP coma EXP pard
;

/**************************************CASTEOS**************************************/
CONVERT_ENTERO: pr_convertiraentero pari EXP pard;

CONVERT_CADENA: pr_convertiracadena pari EXP pard;

/*******************************INSTRUCCIONES DE SELECCION**************************/
SELECCIONA: pr_selecciona pari EXP pard llai CASOS DEFAULTT llad
| pr_selecciona pari EXP pard llai CASOS llad
;

CASOS: CASOS CASO
| CASO;

CASO: pr_caso EXP dospuntos llai INSTRUCCIONES llad;

DEFAULTT: pr_default dospuntos llai INSTRUCCIONES llad;

SI: SSI SINOSIALL SINO
| SSI SINOSIALL
| SSI SINO
| SSI
;

SSI: pr_si pari EXP pard llai INSTRUCCIONES llad;

SINOSIALL: SINOSIALL SINOSI
| SINOSI
;

SINOSI: pr_sino pr_si pari EXP pard llai INSTRUCCIONES llad;

SINO: pr_sino llai INSTRUCCIONES llad;

/********************************INSTRUCCIONES DE CICLOS O BUCLES**********************/
PARA: pr_para pari DECLARACION ptcoma EXP ptcoma EXP pard llai INSTRUCCIONES llad
| pr_para pari ASIGNACION ptcoma EXP ptcoma EXP pard llai INSTRUCCIONES llad;

HACER: pr_hacer llai INSTRUCCIONES llad pr_mientras pari EXP pard;

MIENTRAS: pr_mientras pari EXP pard llai INSTRUCCIONES llad;

/********************************INSTRUCCIONES DE TRANSFERENCIA*************************/
DETENER: pr_detener;

CONTINUAR: pr_continuar;

RETORNAR: pr_retornar EXP
| pr_retornar
;

/*****************************************DECLARACIONES********************************/
DECLARACION: TIPO_DATO id tk_igual EXP
| TIPO_DATO id
| TIPO_DATO id DIMENSIONES
| TIPO_DATO id DIMENSIONES tk_igual ASIG_ARR
;

/******************************************ASIGNACIONES********************************/
ASIGNACION: id tk_igual EXP
| id DIMENSIONES tk_igual EXP;

/*******************************************ARREGLOS***********************************/
DIMENSIONES: DIMENSIONES DIMENSION
| DIMENSION;

DIMENSION: cori EXP cord;

ASIG_ARR: llai UNIARR llad
| llai MULARR llad;

UNIARR: UNIARR coma EXP
| EXP;

MULARR: MULARR coma ASIG_ARR
| ASIG_ARR;

/****************************************TIPO DE DATO***********************************/
TIPO_DATO: pr_entero
| pr_decimal
| pr_booleano
| pr_caracter
| pr_cadena
| id
;

TIPO_RETORNO: TIPO_DATO
| pr_vacio
;

/*+++++++++++++++++++++++++++++++++++++++EXPRESIONES************************************/
EXP: EXP tk_mas EXP
| EXP tk_menos EXP
| EXP tk_por EXP
| EXP tk_div EXP
| tk_menos EXP %prec NEG
| EXP tk_pot EXP
| EXP tk_masmas
| EXP tk_menmen
| EXP tk_mayor EXP
| EXP tk_menor EXP
| EXP tk_mayorigual EXP
| EXP tk_menorigual EXP
| EXP tk_igualigual EXP
| EXP tk_diferente EXP
| EXP tk_or EXP
| EXP tk_and EXP
| tk_not EXP
| pari EXP pard
| CONVERT_ENTERO
| CONVERT_CADENA
| entero
| decimal
| caracter
| cadena
| pr_verdadero
| pr_falso
| pr_nada
| caracter_nulo
| id
;

%%
void yyerror(const char* mens){
    std::cout << "Linea: " << yylineno << std::endl;
    std::cout << mens << " " << yytext << std::endl;
    //return 0;
}
