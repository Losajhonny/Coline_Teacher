%option yylineno
%option noyywrap
%option caseless

%{
#include "parser.h"
int columna=0;
%}

ENTERO          [0-9]+
DECIMAL         [0-9]+"."[0-9]+
CARACTER        ['][^\n\'][']
CADENA          ["][^\n\"]+["]
ID              [A-Za-z][A-Za-z0-9_]*

%%

"'\0'"          {return caracter_nulo;}
"entero"        {return pr_entero;}
"decimal"       {return pr_decimal;}
"caracter"      {return pr_caracter;}
"cadena"        {return pr_cadena;}
"booleano"      {return pr_booleano;}

"nada"          {return pr_nada;}
"tamanio"       {return pr_tamanio;}
"concatenar"    {return pr_concatenar;}
"convertiracadena"  {return pr_convertiracadena;}
"convertiraentero"  {return pr_convertiraentero;}
"clase"         {return pr_clase;}
"este"          {return pr_este;}
"publico"       {return pr_publico;}
"protegido"     {return pr_protegido;}
"privado"       {return pr_privado;}
"hereda_de"     {return pr_hereda_de;}
"@sobrescribir" {return pr_sobrescribir;}
"principal"     {return pr_principal;}
"importar"      {return pr_importar;}
"nuevo"         {return pr_nuevo;}
"vacio"         {return pr_vacio;}

"imprimir"      {return pr_imprimir;}
"detener"       {return pr_detener;}
"continuar"     {return pr_continuar;}
"retornar"      {return pr_retornar;}
"si"            {return pr_si;}
"sino"          {return pr_sino;}
"selecciona"    {return pr_selecciona;}
"caso"          {return pr_caso;}
"default"       {return pr_default;}
"mientras"      {return pr_mientras;}
"hacer"         {return pr_hacer;}
"para"          {return pr_para;}

"lista"         {return pr_lista;}
"insertar"      {return pr_insertar;}
"obtener"       {return pr_obtener;}
"buscar"        {return pr_buscar;}
"pila"          {return pr_pila;}
"apilar"        {return pr_apilar;}
"desapilar"     {return pr_desapilar;}
"cola"          {return pr_cola;}
"encolar"       {return pr_encolar;}
"desencolar"    {return pr_desencolar;}
"mostraredd"    {return pr_mostraredd;}
"leerteclado"   {return pr_leerteclado;}

"verdadero"     {return pr_verdadero;}
"falso"         {return pr_falso;}

{ENTERO}        {return entero;}
{DECIMAL}       {return decimal;}
{CARACTER}      {return caracter;}
{CADENA}        {return cadena;}
{ID}            {return id;}

"("             {return pari;}
")"             {return pard;}
"["             {return cori;}
"]"             {return cord;}
"{"             {return llai;}
"}"             {return llad;}

";"             {return ptcoma;}
":"             {return dospuntos;}
"."             {return punto;}
","             {return coma;}
"?"             {return interr;}

"="             {return tk_igual;}
"+="            {return tk_masigual;}
"-="            {return tk_menigual;}
"*="            {return tk_porigual;}
"/="            {return tk_divigual;}

"+"             {return tk_mas;}
"-"             {return tk_menos;}
"*"             {return tk_por;}
"/"             {return tk_div;}
"^"             {return tk_pot;}
"++"            {return tk_masmas;}
"--"            {return tk_menmen;}

">"             {return tk_mayor;}
"<"             {return tk_menor;}
">="            {return tk_mayorigual;}
"<="            {return tk_menorigual;}
"=="            {return tk_igualigual;}
"!="            {return tk_diferente;}

"||"            {return tk_or;}
"&&"            {return tk_and;}
"!"             {return tk_not;}

[[:blank:]]     {/*Ingorando*/}
.               {}
%%
