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
WORKSPACE = /home/user/Desktop/GitHub/GEMINI
BUILDDATE = 20180312
WORKSPACESOURCE = $${WORKSPACE}/source
WORKSPACETOOLS = $${WORKSPACE}/tools

QT += core gui
QT += websockets

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
linkrunscript.commands = scp ../GEMINI/scripts/RunGEMINI .
first.depends += linkrunscript
QMAKE_EXTRA_TARGETS += first linkrunscript

HEADERS += \
    $${H_DIR}/qtgui/dataloaderpanel.h \
    $${H_DIR}/qtgui/experimentpanel.h \
    $${H_DIR}/qtgui/mainwindow.h \
    $${H_DIR}/qtgui/stylemanager.h \
    $${H_DIR}/qtgui/testwindow.h \
    $${H_DIR}/qtgui/testwindowproxy.h \
    $${H_DIR}/qtgui/toggleswitch.h \
    $${H_DIR}/qtgui/topiccounts.h \
    $${H_DIR}/qtgui/topiccountsummary.h \
    $${H_DIR}/qtgui/topicdetails.h \
    $${H_DIR}/qtgui/topicselector.h \
    $${H_DIR}/proxies/proxyset.h \
    $${H_DIR}/core/corefunction.h \
    # $${H_DIR}/proxies/testwindow_proxy.h \
    $${H_DIR}/headless/headlessapp.h \
    $${H_DIR}/net/abstractdriver.h \
    $${H_DIR}/net/message.h \
    $${H_DIR}/proxies/AbstractProxy.h \
    $${H_DIR}/headless/dataloaderproxy.h \
    $${H_DIR}/headless/experimentproxy.h \
    $${H_DIR}/headless/mainproxy.h \
    #  $${H_DIR}/headless/testwindow_proxy.h \
    $${H_DIR}/headless/testwindowproxy.h \
    $${H_DIR}/headless/topiccountproxy.h \
    $${H_DIR}/headless/topicdetailsproxy.h \
    $${H_DIR}/headless/topicselectorproxy.h \
    #	$${H_DIR}/proxies/experimentproxy.h \
    $${H_DIR}/uiinterface/i_countpanel.h \
    $${H_DIR}/uiinterface/i_dataloader.h \
    $${H_DIR}/uiinterface/i_detailpanel.h \
    $${H_DIR}/uiinterface/i_experiment.h \
    $${H_DIR}/uiinterface/i_main.h \
    $${H_DIR}/uiinterface/i_test.h \
    $${H_DIR}/uiinterface/i_topicpanel.h \
    # Not moved
    $${H_DIR}/common.h \
    $${H_DIR}/detailsummary.h \
    #	$${H_DIR}/topicdetails.h \
    $${H_DIR}/defaultlistener.h \
    $${H_DIR}/defaultstatuslistener.h \
    $${H_DIR}/filequeue.h \
    $${H_DIR}/configureenvironment.h \
    $${H_DIR}/readmessage.h \
    $${H_DIR}/messagelistener.h \
    $${H_DIR}/timeobject.h \
    $${H_DIR}/filestatus.h \
    $${H_DIR}/threadworker.h \
    #	$${H_DIR}/stylemanager.h \
    $${H_DIR}/logentrywidget.h \
    $${H_DIR}/plamessage.h \
    $${H_DIR}/datamanager.h \
    $${H_DIR}/subscriptionmanager.h \
    $${H_DIR}/messagefield.h \
    $${H_DIR}/binaryfilehandler.h \
    #	$${H_DIR}/dataloaderpanel.h \
    $${H_DIR}/xmlfilehandler.h \
    $${H_DIR}/filemode.h \
    include/net/Subscription_I.h \
    include/net/Subscription_I.h \
    include/net/Topic_I.h \
    include/net/Topic_I.h \
    include/net/Workspace/AbstractEnum.h \
    include/net/Workspace/DriverException.h \
    include/net/Workspace/DriverFactory.h \
    include/net/Workspace/EmptyDriver.h \
    include/net/Workspace/source/AllFields.h \
    include/net/Workspace/source/abstractdriver.h \
    include/net/Workspace/topics/Subscription_I.h \
    include/net/Workspace/topics/message.h \
    include/net/Workspace/topics/runner.h \
    include/net/driverfactory.h \
    include/net/drivers/AbstractEnum.h \
    include/net/drivers/AllFields_Driver.h \
    include/net/drivers/DriverException.h \
    include/net/drivers/DriverFactory.h \
    include/net/drivers/EmptyDriver.h \
    include/net/drivers/FactoryInterface.h \
    include/net/message.h \
    include/net/source/AllFields.h \
    include/net/source/AllFieldsDriver_Test.h \
    include/net/source/abstractTest.h \
    include/net/source/abstractdriver.h \
    include/net/source/enum.h \
    include/net/topics/Subscription_I.h \
    include/net/topics/Topic_I.h \
    include/net/topics/message.h \
    include/net/topics/runner.h \
    include/plugin.h \
    include/topicselectorlogic.h
    #$${H_DIR}/external/rticonnection.h \
    #$${H_DIR}/external/rtitester.h \

SOURCES += \
    $${CPP_DIR}/main.cpp \
    $${CPP_DIR}/qtgui/mainwindow.cpp \
    $${CPP_DIR}/qtgui/dataloaderpanel.cpp \
    $${CPP_DIR}/qtgui/experimentpanel.cpp \
    $${CPP_DIR}/qtgui/stylemanager.cpp \
    $${CPP_DIR}/qtgui/toggleswitch.cpp \
    $${CPP_DIR}/qtgui/topiccounts.cpp \
    $${CPP_DIR}/qtgui/topiccountsummary.cpp \
    $${CPP_DIR}/qtgui/topicdetails.cpp \
    $${CPP_DIR}/qtgui/topicselector.cpp \
    $${CPP_DIR}/qtgui/testwindow.cpp \
    $${CPP_DIR}/core/corefunction.cpp \
    $${CPP_DIR}/proxies/proxyset.cpp \
    #	$${CPP_DIR}/proxies/testwindow_proxy.cpp \
    $${CPP_DIR}/headless/headlessapp.cpp \
    $${CPP_DIR}/net/message.cpp \
    $${CPP_DIR}/headless/dataloaderproxy.cpp \
    $${CPP_DIR}/headless/experimentproxy.cpp \
    $${CPP_DIR}/headless/mainproxy.cpp \
    #	$${CPP_DIR}/headless/testwindow_proxy.cpp \
    $${CPP_DIR}/headless/testwindowproxy.cpp \
    $${CPP_DIR}/headless/topiccountproxy.cpp \
    $${CPP_DIR}/headless/topicdetailsproxy.cpp \
    $${CPP_DIR}/headless/topicselectorproxy.cpp \
    #	$${CPP_DIR}/qtgui/testwindowproxy.cpp \
    #Not moved
    $${CPP_DIR}/common.cpp \
    $${CPP_DIR}/detailsummary.cpp \
    $${CPP_DIR}/defaultlistener.cpp \
    $${CPP_DIR}/defaultstatuslistener.cpp \
    $${CPP_DIR}/filequeue.cpp \
    $${CPP_DIR}/configureenvironment.cpp \
    $${CPP_DIR}/readmessage.cpp \
    $${CPP_DIR}/timeobject.cpp \
    $${CPP_DIR}/threadworker.cpp \
    $${CPP_DIR}/logentrywidget.cpp \
    $${CPP_DIR}/datamanager.cpp \
    $${CPP_DIR}/subscriptionmanager.cpp \
    $${CPP_DIR}/messagelistener.cpp \
    $${CPP_DIR}/messagefield.cpp \
    $${CPP_DIR}/binaryfilehandler.cpp \
    $${CPP_DIR}/xmlfilehandler.cpp \
    $${CPP_DIR}/uiinterface/i_countpanel.cpp \
    $${CPP_DIR}/uiinterface/i_dataloader.cpp \
    $${CPP_DIR}/uiinterface/i_detailpanel.cpp \
    $${CPP_DIR}/uiinterface/i_experiment.cpp \
    $${CPP_DIR}/uiinterface/i_main.cpp \
    $${CPP_DIR}/uiinterface/i_test.cpp \
    $${CPP_DIR}/uiinterface/i_topicpanel.cpp \
    src/topicselectorlogic.cpp

    #$${CPP_DIR}/external/rticonnection.cpp \
    #$${CPP_DIR}/external/rtitester.cpp \

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

DISTFILES += \
    ../../../Downloads/ui_mainwindow.py \
    ../../../TopicSelectorClient.html \
    ui/TopicSelectorClient.txt \
    ui/experimentpanel_test.py \
    ui/test.py
