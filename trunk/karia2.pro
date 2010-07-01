# NullGet.pro --- 
# 
# Author: liuguangzhao
# Copyright (C) 2007-2010 liuguangzhao@users.sf.net
# URL: 
# Created: 2010-04-03 19:19:40 +0800
# Version: $Id$
# 
######################################################################
# Automatically generated by qmake (2.01a) ??? ?? 11 17:28:45 2006
######################################################################

TEMPLATE = app
TARGET = 
DEPENDPATH += . GeneratedFiles
INCLUDEPATH += .
CONFIG += debug
QT = core gui xml network sql

DESTDIR = ./bin
UI_HEADERS_DIR = GeneratedFiles
MOC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp
#CONFIG += qtestlib

documentation.path = /
documentation.files = release/*.exe
documentation.extra = cp release/*.exe Z:/temp

INSTALLS += documentation

VERSION = 0.0.96

#########################
INCLUDEPATH += ./libmaia/ ./qtsingleapplication ./skynet

unix{
	LIBS += -lssl    	
}
win32 {
	win32-g++ {
		# -mwindows can drop the dos window when app run. got this knowleage at dev-cpp's makefile generate function
        #LIBS += -LD:/msys/1.0/local/ssl/lib/ -mwindows -lssl -lcrypto -lwsock32 -lgdi32
  	    #LIBS += -LD:/msys/1.0/local/ssl/lib/ -mwindows -lssl -lcrypto -lws2_32 -lgdi32
  	    LIBS += -LD:/librarys/mw-ssl/lib/ -mwindows -lssl -lcrypto -lws2_32 -lgdi32 -lpsapi
        INCLUDEPATH += D:/librarys/mw-ssl/include 	
        QMAKE_LFLAGS_WINDOWS = 
	} else {
      # LIBS += wsock32.lib  E:/library/openssl/lib/libeay32.lib E:/library/openssl/lib/ssleay32.lib 
      # LIBS += ws2_32.lib  E:/library/openssl/lib/libeay32.lib E:/library/openssl/lib/ssleay32.lib 
        ## check cl.exe, x64 or x86
        CLARCH=$$system(path)
        VAMD64=$$find(CLARCH,amd64)
        isEmpty(VAMD64) {
            # from qt 4.7, use QMAKE_LIBDIR instead of LIBPATH
            LIBPATH += Z:/librarys/vc-ssl-x86/lib Z:/librarys/vc-zlib/lib
            QMAKE_LIBDIR += Z:/librarys/vc-ssl-x86/lib Z:/librarys/vc-zlib/lib
            INCLUDEPATH += Z:/librarys/vc-ssl-x86/include/
        } else {
            LIBPATH += Z:/librarys/vc-ssl-x64/lib Z:/librarys/vc-zlib/lib
            QMAKE_LIBDIR += Z:/librarys/vc-ssl-x64/lib Z:/librarys/vc-zlib/lib
            INCLUDEPATH += Z:/librarys/vc-ssl-x64/include/
        }

      #      LIBPATH += Z:/librarys/vc-ssl/lib Z:/librarys/vc-zlib/lib
      # INCLUDEPATH += Z:/librarys/vc-ssl/include/
      LIBS += -lqtmain -lzlib -llibeay32 -lssleay32 -ladvapi32 -luser32 -lpsapi -lws2_32
      RESOURCES = NullGet.rc
      # QMAKE_LFLAGS_WINDOWS = /SUBSYSTEM:console
    }
}

DEFINES += "KARIA2_VERSION=\\\"$$VERSION\\\""

#添加这一块可以使得在windows上编译出来的程序有图标 
win32 {
   RC_FILE	= karia2.rc
}    

## libmaia
MAIA_HEADERS = libmaia/maiaObject.h libmaia/maiaFault.h libmaia/maiaXmlRpcClient.h \
             libmaia/maiaXmlRpcServer.h libmaia/maiaXmlRpcServerConnection.h
MAIA_SOURCES = libmaia/maiaObject.cpp libmaia/maiaFault.cpp libmaia/maiaXmlRpcClient.cpp \
             libmaia/maiaXmlRpcServer.cpp libmaia/maiaXmlRpcServerConnection.cpp

QTSAPP_HEADERS = qtsingleapplication/qtsingleapplication.h qtsingleapplication/qtlocalpeer.h
QTSAPP_SOURCES = qtsingleapplication/qtsingleapplication.cpp qtsingleapplication/qtlocalpeer.cpp

SKYNET_HEADERS = skynet/xmessages.h skynet/skypecommon.h skynet/skypecommand.h \
               skynet/skype.h
SKYNET_SOURCES = skynet/xmessages.cpp skynet/skypecommon_X11.cpp skynet/skypecommand.cpp \
               skynet/skype.cpp

## qtxmlrpc library
include(./qxmlrpc/client/client.pri)

# Input
HEADERS += aboutdialog.h \
           abstractstorage.h \
           batchjobmandlg.h \
           catmandlg.h \
           catpropdlg.h \
           dlrules.h \
           dropzone.h \
           dircompletermodel.h	\
           hash.h \
           instantspeedhistogramwnd.h \
           labspace.h \
           norwegianwoodstyle.h \
           nullcontroller.h \
           karia2.h \
           nullgetapplication.h \
           radarscanner.h \
           resource.h \
           rulesmandlg.h \
           segmentlogmodel.h \
           serverswitcher.h \
           skypeclientwnd.h \
           sqlitecategorymodel.h \
           sqlitesegmentmodel.h \
           sqlitestorage.h \
           sqlitetaskmodel.h \
           storageexception.h \
           storagefactory.h \
           taskballmapwidget.h \
           taskinfodisgestwnd.h \
           taskinfodlg.h \
           taskqueue.h \
           utility.h \
           walksitewnd.h \
           walksitewndex.h \
           webpagelinkdlg.h \
           xmlstorage.h \   
           optionmanager.h \
           preferencesdialog.h	\        
           ariaman.h      \
           libng/html-parse.h \
           libng/md5.h \
           torrentpeermodel.h \
           taskservermodel.h \
           seedfilemodel.h \
           seedfilesdialog.h \  
           taskitemdelegate.h \
           skypetracer.h

win32{
        HEADERS += DiskInfo.h	
}      

SOURCES += aboutdialog.cpp \
           abstractstorage.cpp \
           batchjobmandlg.cpp \
           catmandlg.cpp \
           catpropdlg.cpp \
           dlrules.cpp \
           dropzone.cpp \
           dircompletermodel.cpp	\
           hash.cpp \
           instantspeedhistogramwnd.cpp \
           labspace.cpp \
           main.cpp \
           norwegianwoodstyle.cpp \
           nullcontroller.cpp \
           karia2.cpp \
           nullgetapplication.cpp \
           radarscanner.cpp \
           rulesmandlg.cpp \
           segmentlogmodel.cpp \
           serverswitcher.cpp \
           skypeclientwnd.cpp \
           sqlitecategorymodel.cpp \
           sqlitesegmentmodel.cpp \
           sqlitestorage.cpp \
           sqlitetaskmodel.cpp \
           storageexception.cpp \
           storagefactory.cpp \
           taskballmapwidget.cpp \
           taskinfodisgestwnd.cpp \
           taskinfodlg.cpp \
           taskqueue.cpp \
           utility.cpp \
           walksitewnd.cpp \
           walksitewndex.cpp \
           webpagelinkdlg.cpp \
           xmlstorage.cpp \      
           optionmanager.cpp \
           preferencesdialog.cpp	\     
           ariaman.cpp \
           libng/html-parse.c \
           libng/md5.c  \
           libng/qtmd5.cpp \
           torrentpeermodel.cpp \
           taskservermodel.cpp \
           seedfilemodel.cpp \
           seedfilesdialog.cpp \
           taskitemdelegate.cpp \
           mimetypeshash.cpp \
           skypetracer.cpp
win32{
        SOURCES += DiskInfo.cpp
}  

FORMS += aboutdialog.ui \
         batchjobmandlg.ui \
         catmandlg.ui \
         catpropdlg.ui \
         columnsmandlg.ui \
         dlrules.ui \
         karia2.ui \
         rulesmandlg.ui \
         skypeclientwnd.ui \
         taskinfodisgestwnd.ui \
         taskinfodlg.ui \
         walksitewnd.ui \
         walksitewndex.ui \
         webpagehostselectdlg.ui \
         webpagelinkdlg.ui \
         webpageurlinputdlg.ui	\
         labspace.ui				\
         preferencesdialog.ui  \
         seedfilesdialog.ui \
         proxyinfodialog.ui \
         skypetracer.ui

HEADERS += $$MAIA_HEADERS 
SOURCES += $$MAIA_SOURCES 

HEADERS += $$QTSAPP_HEADERS
SOURCES += $$QTSAPP_SOURCES

HEADERS += $$SKYNET_HEADERS
SOURCES += $$SKYNET_SOURCES

TRANSLATIONS += translations/karia2_en_US.ts \
                translations/karia2_zh_CN.ts \
                translations/karia2_zh_TW.ts

RESOURCES = karia2.qrc
