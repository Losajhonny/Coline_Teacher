#ifndef ENTORNO_H
#define ENTORNO_H

#include "list"
#include "simbolo.h"
#include "QString"

class Entorno
{
public:
    Entorno *ant;
    Entorno(Entorno *ant);
    std::list<Simbolo> tabla;
    void agregar(QString id, Simbolo *s);
};

#endif // ENTORNO_H
