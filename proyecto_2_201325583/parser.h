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
    tk_mas = 258,
    tk_menos = 259,
    tk_por = 260,
    tk_div = 261,
    tk_pot = 262,
    pari = 263,
    pard = 264,
    llai = 265,
    llad = 266,
    dospuntos = 267,
    igual = 268,
    ptcoma = 269,
    pr_selecciona = 270,
    pr_caso = 271,
    pr_default = 272,
    pr_mientras = 273,
    pr_hacer = 274,
    pr_para = 275,
    pr_entero = 276,
    pr_decimal = 277,
    pr_booleano = 278,
    pr_caracter = 279,
    pr_cadena = 280,
    pr_vacio = 281,
    pr_imprimir = 282,
    pr_verdadero = 283,
    pr_falso = 284,
    entero = 285,
    decimal = 286,
    caracter = 287,
    cadena = 288,
    id = 289
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 20 "sintactico_cn.y" /* yacc.c:1909  */

int INTEGER;
char TEXT [256];
struct Nodo *NODE;

#line 95 "parser.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_H_INCLUDED  */
