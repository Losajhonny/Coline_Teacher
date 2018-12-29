#ifndef SIMBOLO_H
#define SIMBOLO_H
#include "QString"

class Simbolo
{
public:
    QString id;
    int direccion;
    int tamanio;
    int tipo;
    QString ambito;

    Simbolo();
};

#endif // SIMBOLO_H
