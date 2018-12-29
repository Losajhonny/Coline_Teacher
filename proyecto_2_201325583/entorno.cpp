#include "entorno.h"

Entorno::Entorno(Entorno *ant)
{
    this->ant = ant;
}

void Entorno::agregar(QString id, Simbolo *s)
{
    //ahora debo buscar si existe el simbolo
}
