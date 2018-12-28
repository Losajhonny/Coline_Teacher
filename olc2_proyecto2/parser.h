/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    pr_entero = 258,
    pr_decimal = 259,
    pr_caracter = 260,
    pr_cadena = 261,
    pr_booleano = 262,
    pr_nada = 263,
    pr_tamanio = 264,
    pr_concatenar = 265,
    pr_convertiracadena = 266,
    pr_convertiraentero = 267,
    pr_clase = 268,
    pr_este = 269,
    pr_publico = 270,
    pr_protegido = 271,
    pr_privado = 272,
    pr_hereda_de = 273,
    pr_sobrescribir = 274,
    pr_principal = 275,
    pr_importar = 276,
    pr_nuevo = 277,
    pr_vacio = 278,
    pr_imprimir = 279,
    pr_detener = 280,
    pr_continuar = 281,
    pr_retornar = 282,
    pr_si = 283,
    pr_sino = 284,
    pr_selecciona = 285,
    pr_caso = 286,
    pr_default = 287,
    pr_mientras = 288,
    pr_hacer = 289,
    pr_para = 290,
    pr_lista = 291,
    pr_insertar = 292,
    pr_obtener = 293,
    pr_buscar = 294,
    pr_pila = 295,
    pr_apilar = 296,
    pr_desapilar = 297,
    pr_cola = 298,
    pr_encolar = 299,
    pr_desencolar = 300,
    pr_mostraredd = 301,
    pr_leerteclado = 302,
    pr_verdadero = 303,
    pr_falso = 304,
    entero = 305,
    decimal = 306,
    caracter = 307,
    cadena = 308,
    id = 309,
    pari = 310,
    pard = 311,
    cori = 312,
    cord = 313,
    llai = 314,
    llad = 315,
    ptcoma = 316,
    dospuntos = 317,
    punto = 318,
    coma = 319,
    tk_igual = 320,
    tk_masigual = 321,
    tk_menigual = 322,
    tk_porigual = 323,
    tk_divigual = 324,
    tk_mas = 325,
    tk_menos = 326,
    tk_por = 327,
    tk_div = 328,
    tk_pot = 329,
    tk_masmas = 330,
    tk_menmen = 331,
    tk_mayor = 332,
    tk_menor = 333,
    tk_mayorigual = 334,
    tk_menorigual = 335,
    tk_igualigual = 336,
    tk_diferente = 337,
    tk_or = 338,
    tk_and = 339,
    tk_not = 340
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_H_INCLUDED  */
