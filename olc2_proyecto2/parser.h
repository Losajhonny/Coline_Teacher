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
    caracter_nulo = 258,
    pr_entero = 259,
    pr_decimal = 260,
    pr_caracter = 261,
    pr_cadena = 262,
    pr_booleano = 263,
    pr_nada = 264,
    pr_tamanio = 265,
    pr_concatenar = 266,
    pr_convertiracadena = 267,
    pr_convertiraentero = 268,
    pr_clase = 269,
    pr_este = 270,
    pr_publico = 271,
    pr_protegido = 272,
    pr_privado = 273,
    pr_hereda_de = 274,
    pr_sobrescribir = 275,
    pr_principal = 276,
    pr_importar = 277,
    pr_nuevo = 278,
    pr_vacio = 279,
    pr_imprimir = 280,
    pr_detener = 281,
    pr_continuar = 282,
    pr_retornar = 283,
    pr_si = 284,
    pr_sino = 285,
    pr_selecciona = 286,
    pr_caso = 287,
    pr_default = 288,
    pr_mientras = 289,
    pr_hacer = 290,
    pr_para = 291,
    pr_lista = 292,
    pr_insertar = 293,
    pr_obtener = 294,
    pr_buscar = 295,
    pr_pila = 296,
    pr_apilar = 297,
    pr_desapilar = 298,
    pr_cola = 299,
    pr_encolar = 300,
    pr_desencolar = 301,
    pr_mostraredd = 302,
    pr_leerteclado = 303,
    pr_verdadero = 304,
    pr_falso = 305,
    entero = 306,
    decimal = 307,
    caracter = 308,
    cadena = 309,
    id = 310,
    pari = 311,
    pard = 312,
    cori = 313,
    cord = 314,
    llai = 315,
    llad = 316,
    ptcoma = 317,
    dospuntos = 318,
    punto = 319,
    coma = 320,
    interr = 321,
    tk_igual = 322,
    tk_masigual = 323,
    tk_menigual = 324,
    tk_porigual = 325,
    tk_divigual = 326,
    tk_mas = 327,
    tk_menos = 328,
    tk_por = 329,
    tk_div = 330,
    tk_pot = 331,
    tk_masmas = 332,
    tk_menmen = 333,
    tk_mayor = 334,
    tk_menor = 335,
    tk_mayorigual = 336,
    tk_menorigual = 337,
    tk_igualigual = 338,
    tk_diferente = 339,
    tk_or = 340,
    tk_and = 341,
    tk_not = 342,
    NEG = 343
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
