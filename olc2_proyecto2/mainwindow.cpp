#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_btn_compile_clicked()
{
    QString texto = ui->txt_edit->toPlainText();
    QString ruta = crearArchivo("entrada.txt", texto);
    const char* x = ruta.toStdString().c_str();

    FILE* input;
    input = fopen(x, "rb");
    yyrestart(input);
    yyparse();
    fclose(input);

    //QMessageBox msgBox;
    //msgBox.setText("FIN DEL ANALISIS");
    //msgBox.exec();

    //Nodo * root = getRaiz();
    //QString valor = "hola";
}

QString MainWindow::crearArchivo(QString ruta, QString texto)
{
    ofstream file;
    file.open(ruta.toStdString().c_str(), ios::trunc);
    file << texto.toStdString() << endl;
    file.close();
    return ruta;
}
