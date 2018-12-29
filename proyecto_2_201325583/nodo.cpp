#include "nodo.h"

Nodo::Nodo()
{

}

Nodo::~Nodo()
{
    //delete hijos;
    delete expresion;
    delete instrucciones;
    delete inicializacion;
    delete actualizacion;
    delete izq;
    delete der;

}
