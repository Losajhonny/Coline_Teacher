%option yylineno
%option noyywrap
%option caseless

%{
#include "parser.h"
%}

ENTERO          [0-9]+
DECIMAL         [0-9]+"."[0-9]+
CARACTER        ['][^\n\'][']
CADENA          ["][^\n\"]+["]
ID              [A-Za-z][A-Za-z0-9_]*
%%
"+"             {return tk_mas;}
"-"             {return tk_menos;}
"*"             {return tk_por;}
"/"             {return tk_div;}
"^"             {return tk_pot;}

"("             {return pari;}
")"             {return pard;}
"{"             {return llai;}
"}"             {return llad;}

":"             {return dospuntos;}
"="             {return igual;}
";"             {return ptcoma;}

"selecciona"    {return pr_selecciona;}
"caso"          {return pr_caso;}
"default"       {return pr_default;}

"mientras"      {strcpy(yylval.TEXT, yytext); return pr_mientras;}
"hacer"         {strcpy(yylval.TEXT, yytext); return pr_hacer;}
"para"          {strcpy(yylval.TEXT, yytext); return pr_para;}
"imprimir"      {strcpy(yylval.TEXT, yytext); return pr_imprimir;}


"entero"        {strcpy(yylval.TEXT, yytext); return pr_entero;}
"decimal"       {strcpy(yylval.TEXT, yytext); return pr_decimal;}
"booleano"      {strcpy(yylval.TEXT, yytext); return pr_booleano;}
"caracter"      {strcpy(yylval.TEXT, yytext); return pr_caracter;}
"cadena"        {strcpy(yylval.TEXT, yytext); return pr_cadena;}
"vacio"         {return pr_vacio;}

"verdadero"     {strcpy(yylval.TEXT, yytext); return pr_verdadero;}
"falso"         {strcpy(yylval.TEXT, yytext); return pr_falso;}
{ENTERO}        {strcpy(yylval.TEXT, yytext); return entero;}
{DECIMAL}       {strcpy(yylval.TEXT, yytext); return decimal;}
{CARACTER}      {strcpy(yylval.TEXT, yytext); return caracter;}
{CADENA}        {strcpy(yylval.TEXT, yytext); return cadena;}
{ID}            {strcpy(yylval.TEXT, yytext); return id;}

[[:blank:]]     {/*ignorando*/}
.               {}
%%
