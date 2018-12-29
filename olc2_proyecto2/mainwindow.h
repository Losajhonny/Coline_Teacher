#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <iostream>
#include <fstream>

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

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_btn_compile_clicked();
    QString crearArchivo(QString ruta, QString texto);
private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
