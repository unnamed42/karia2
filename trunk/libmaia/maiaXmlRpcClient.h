/*
 * libMaia - maiaXmlRpcClient.h
 * Copyright (c) 2007 Sebastian Wiedenroth <wiedi@frubar.net>
 *                and Karl Glatz
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef MAIAXMLRPCCLIENT_H
#define MAIAXMLRPCCLIENT_H

#include <QtCore>
#include <QtXml>
#include <QtNetwork>

#include "maiaObject.h"

class MaiaXmlRpcClient : public QObject {
	Q_OBJECT;
	
public:
    MaiaXmlRpcClient(QObject* parent = 0);
    MaiaXmlRpcClient(QUrl url, QObject* parent = 0);
    ~MaiaXmlRpcClient();

    void setUrl(QUrl url);
    void call(QString method, QList<QVariant> args,
              QObject* responseObject, const char* responseSlot,
              QObject* faultObject, const char* faultSlot);

    void call(QString method, QList<QVariant> args, QVariant payload,
              QObject* responseObject, const char* responseSlot,
              QObject* faultObject, const char* faultSlot);
	
private slots:
    void httpRequestDone(int id, bool error);
    void responseHeaderReceived(QHttpResponseHeader header);

private:
    QUrl m_url;
    // in qt 4.6.2, this class is marked as obsolete. also QFtp. 
    // Use which class now? QNetworkAccessManager?
    QHttp *http;
    QMap<int, MaiaObject*> callmap;
    QString cookie;
};

#endif