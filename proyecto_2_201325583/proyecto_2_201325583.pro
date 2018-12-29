#-------------------------------------------------
#
# Project created by QtCreator 2018-12-26T12:02:49
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = proyecto_2_201325583
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        principal.cpp \
    parser.cpp \
    scanner.cpp \
    simbolo.cpp \
    entorno.cpp \
    nodo.cpp

HEADERS += \
        principal.h \
    parser.h \
    scanner.h \
    simbolo.h \
    entorno.h \
    nodo.h

FORMS += \
        principal.ui

DISTFILES += \
    lexico_cn.l \
    sintactico_cn.y
