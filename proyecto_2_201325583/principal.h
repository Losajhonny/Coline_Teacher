#ifndef PRINCIPAL_H
#define PRINCIPAL_H

#include <QMainWindow>
#include <iostream>
#include <fstream>

#include <nodo.h>
#include <stdio.h>
#include <stdlib.h>
#include <parser.h>
#include <QTextEdit>
#include <QFile>
#include <QTextStream>
#include <qmessagebox.h>

using namespace std;

extern void yyrestart( FILE* archivo);//Metodo que pasa el archivo a flex
extern int yyparse();//metod que inicia el analisis sintatico
extern void setSalida(QTextEdit* sal);//metodo creado en el analizador para comunicaar principal con el parser
extern Nodo * getRaiz();

namespace Ui {
class principal;
}

class principal : public QMainWindow
{
    Q_OBJECT

public:
    explicit principal(QWidget *parent = 0);
    ~principal();
    QString crear_Archivo(QString nombre, QString texto);

private slots:
    void on_btn_compilar_clicked();

private:
    Ui::principal *ui;
};

#endif // PRINCIPAL_H
