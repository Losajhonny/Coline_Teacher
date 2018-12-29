#include "principal.h"
#include "ui_principal.h"

principal::principal(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::principal)
{
    ui->setupUi(this);
}

principal::~principal()
{
    delete ui;
}

QString principal::crear_Archivo(QString nombre, QString texto)
{
    ofstream file;
    file.open(nombre.toStdString().c_str(), ios::trunc);
    file << texto.toStdString() << endl;
    file.close();
    return nombre;
}

void principal::on_btn_compilar_clicked()
{
    QString texto = ui->txt_edit->toPlainText();
    QString ruta = crear_Archivo("entrada.txt", texto);
    const char* x = ruta.toStdString().c_str();

    FILE* input;
    input = fopen(x, "rb");
    yyrestart(input);
    yyparse();
    fclose(input);

    //QMessageBox msgBox;
    //msgBox.setText("FIN DEL ANALISIS");
    //msgBox.exec();

    Nodo * root = getRaiz();
    QString valor = "hola";
}
