#ifndef NODO_H
#define NODO_H
#include "vector"
#include "QString"

//CONSTANTES PARA TIPOS DE DATOS
#define ENTERO 100
#define DECIMAL 101
#define BOOLEANO 102
#define CARACTER 103
#define CADENA 104
#define ID 105
#define VACIO 106

/*CONSTANTES PARA LAS EXPRESIONES ARITMETICAS*/
#define MAS 200
#define MENOS 201
#define POR 202
#define DIV 203
#define POT 204
#define MASMAS 205
#define MENMEN 206

/*CONSTANTES PARA LAS EXPRESIONES RELACIONALES*/
#define MAYOR 300
#define MENOR 301
#define MAYORIGUAL 302
#define MENORIGUAL 303
#define IGUALIGUAL 304
#define DIFERENTE 305

/*CONSTANTES PARA LAS EXPRESIOENS LOGICOS*/
#define OR 400
#define AND 401
#define NOT 402

/*CONSTANTES PARA LAS ASIGNACIONES*/
#define MASIGUAL 500
#define PORIGUAL 501
#define MENIGUAL 502
#define DIVIGUAL 503
#define IGUAL 504

/*CONSTANTES PARA LAS INSTRUCCIONES*/
#define CDECLARACION 600
#define CASIGNACION 601
#define CDECLARACION_ARREGLO 602
#define CASIGNACION_ARREGLO 603
#define CIMPRIMIR 604
#define CDETENER 605
#define CCONTINUAR 606
#define CRETORNAR 607
#define CTERNARIO_SI 608
#define CSI 609
#define CSELECCIONA 610
#define CMIENTRAS 611
#define CHACER 612
#define CPARA 613


/*OTROS TIPOS DE CONSTANTES*/
#define CARBOL 614
#define CSENTENCIAS 615
#define CINSTRUCCIONES 616
#define CPRIMITIVO 617
#define CVARIABLE 618

class Nodo
{
public:
    /*Atributo que identifica el nodo del arbol*/
    int tipo_nodo;

    /*Hijos del nodo
    pueden ser las instrucciones que se realizan
    de un mientras, hacer, etc*/
    std::vector<Nodo*> hijos;

    /*Representa una condicion de instrucciones
    de seleccion, ciclos, etc*/
    Nodo * expresion;

    /*Representa el nodo donde se encuentran todas
    las instrucciones a realizarse*/
    Nodo * instrucciones;

    /*Representan la inicializacion y actualizacion
    del nodo PARA para realizar sus funciones*/
    Nodo * inicializacion;
    Nodo * actualizacion;

    /*En caso de utilizar expresiones debo tener un nodo izq y der
    ademas se debe de especificar el tipo de nodo para que realice la
    funcion*/
    Nodo * izq;
    Nodo * der;

    /*Informacion del nodo primitivo o variable o otro tipo de informacion*/
    QString tipo_datoc;         //tipo de dato en cadena
    int tipo_dato;
    int line;
    int colm;
    QString valor;

    Nodo();
    ~Nodo();
};

#endif // NODO_H
