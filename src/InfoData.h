#ifndef INFODATA_H
#define INFODATA_H

#include <QObject>
#include <QString>
#include <QVariantMap>

class InfoData : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString component READ component WRITE setComponent NOTIFY componentChanged)
    Q_PROPERTY(QString higUrl READ higUrl NOTIFY higUrlChanged)
    Q_PROPERTY(QString sourceUrl READ sourceUrl NOTIFY sourceUrlChanged)
    Q_PROPERTY(QString apiUrl READ apiUrl NOTIFY apiUrlChanged)
    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    Q_PROPERTY(QString text READ text NOTIFY textChanged)

public:
    InfoData(QObject *parent = nullptr);
    
    QString component() const;
    QString higUrl() const;
    QString sourceUrl() const;
    QString apiUrl() const;
    QString title() const;
    QString text() const;
    
    void setComponent(const QString &componentName);

Q_SIGNALS:
    void componentChanged();
    void higUrlChanged();
    void sourceUrlChanged();
    void apiUrlChanged();
    void titleChanged();
    void textChanged();

private:
    void setComponentData();
    void clearComponentData();

    QString m_component;
    QString m_higUrl;
    QString m_sourceUrl;
    QString m_apiUrl;
    QString m_title;
    QString m_text;
    QVariantMap m_jsonMap;
};

#endif // INFODATA_H
