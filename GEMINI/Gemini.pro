#-------------------------------------------------
#
# Project created by QtCreator 2017-07-20T14:40:02
#
#-------------------------------------------------

###
# These make it easier to move the project between machines.
#
# * WORKSPACE should be set to the path of the 'Workspace' directory created
#   during the "Installing PLA" section of the GEMINI Build Procedures (v1.4)
# * BUILDDATE should be set to the date on which you built PLA on your system.
#   If you do not remember the date, you can find it tacked onto the end of
#   directory names in 'Workspace/source'
# * WORKSPACESOURCE and WORKSPACETOOLS should not need to be changed unless
#   the names of the 'source' and 'tools' directories are changed
###
WORKSPACE = /home/gemini/Workspace
BUILDDATE = 20180312
WORKSPACESOURCE = $${WORKSPACE}/source
WORKSPACETOOLS = $${WORKSPACE}/tools

QT += core gui
CONFIG += c++11
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
TARGET = Gemini
TEMPLATE = app
RESOURCES = resources/resources.qrc

###
# .h files go in include/ directory
# .cpp files go in src/ directory
# .ui (and generated .uic) files go in ui/ directory
###
H_DIR = include
CPP_DIR = src
USER_UI_DIR = ui
UI_DIR = ui_generated
DESTDIR = bin
OBJECTS_DIR = obj
MOC_DIR = moc

###
# Force `make clean` to delete directories created by qmake, along with their
# temporary files
###
QMAKE_CLEAN += -r obj moc ui_generated bin qrc_resources.cpp RunGEMINI

###
# Generate RunGEMINI script in top-level directory
###
linkrunscript.commands = scp scripts/RunGEMINI .
first.depends += linkrunscript
QMAKE_EXTRA_TARGETS += first linkrunscript

HEADERS += \
    $${H_DIR}/mainwindow.h \
    $${H_DIR}/topicselector.h \
    $${H_DIR}/experimentpanel.h \
    $${H_DIR}/common.h \
    $${H_DIR}/topiccounts.h \
    $${H_DIR}/topiccountsummary.h \
    $${H_DIR}/detailsummary.h \
    $${H_DIR}/topicdetails.h \
    $${H_DIR}/defaultlistener.h \
    $${H_DIR}/testwindow.h \
    $${H_DIR}/defaultstatuslistener.h \
    $${H_DIR}/filequeue.h \
    $${H_DIR}/configureenvironment.h \
    $${H_DIR}/readmessage.h \
    $${H_DIR}/messagelistener.h \
    $${H_DIR}/timeobject.h \
    $${H_DIR}/filestatus.h \
    $${H_DIR}/threadworker.h \
    $${H_DIR}/stylemanager.h \
    $${H_DIR}/logentrywidget.h \
    $${H_DIR}/plamessage.h \
    $${H_DIR}/datamanager.h \
    $${H_DIR}/subscriptionmanager.h \
    $${H_DIR}/messagefield.h \
    $${H_DIR}/binaryfilehandler.h \
    $${H_DIR}/dataloaderpanel.h \
    $${H_DIR}/toggleswitch.h \
    $${H_DIR}/xmlfilehandler.h \
    $${H_DIR}/filemode.h

SOURCES += \
    $${CPP_DIR}/main.cpp \
    $${CPP_DIR}/mainwindow.cpp \
    $${CPP_DIR}/topicselector.cpp \
    $${CPP_DIR}/experimentpanel.cpp \
    $${CPP_DIR}/common.cpp \
    $${CPP_DIR}/topiccounts.cpp \
    $${CPP_DIR}/topiccountsummary.cpp \
    $${CPP_DIR}/detailsummary.cpp \
    $${CPP_DIR}/topicdetails.cpp \
    $${CPP_DIR}/defaultlistener.cpp \
    $${CPP_DIR}/testwindow.cpp \
    $${CPP_DIR}/defaultstatuslistener.cpp \
    $${CPP_DIR}/filequeue.cpp \
    $${CPP_DIR}/configureenvironment.cpp \
    $${CPP_DIR}/readmessage.cpp \
    $${CPP_DIR}/timeobject.cpp \
    $${CPP_DIR}/threadworker.cpp \
    $${CPP_DIR}/stylemanager.cpp \
    $${CPP_DIR}/logentrywidget.cpp \
    $${CPP_DIR}/datamanager.cpp \
    $${CPP_DIR}/subscriptionmanager.cpp \
    $${CPP_DIR}/messagelistener.cpp \
    $${CPP_DIR}/messagefield.cpp \
    $${CPP_DIR}/dataloaderpanel.cpp \
    $${CPP_DIR}/toggleswitch.cpp \
    $${CPP_DIR}/binaryfilehandler.cpp \
    $${CPP_DIR}/xmlfilehandler.cpp

FORMS += \
    $${USER_UI_DIR}/mainwindow.ui \
    $${USER_UI_DIR}/topicselector.ui \
    $${USER_UI_DIR}/experimentpanel.ui \
    $${USER_UI_DIR}/topiccounts.ui \
    $${USER_UI_DIR}/topiccountsummary.ui \
    $${USER_UI_DIR}/detailsummary.ui \
    $${USER_UI_DIR}/topicdetails.ui \
    $${USER_UI_DIR}/testwindow.ui \
    $${USER_UI_DIR}/logentrywidget.ui \
    $${USER_UI_DIR}/dataloaderpanel.ui

INCLUDEPATH += \
    $${H_DIR} \
    $${WORKSPACE}/Drivers

LIBS +=\
