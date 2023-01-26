#include "InfoData.h"
#include <QDebug>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QVariantMap>

InfoData::InfoData(QObject *parent)
    : QObject(parent)
{
    QByteArray infoSheetData;
    QFile file(QStringLiteral("://info-data.json"));

    if(file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        infoSheetData = file.readAll();
        file.close();
    }

    QJsonObject jsonObject;
    QJsonDocument data = QJsonDocument::fromJson(infoSheetData);

    if (!data.isEmpty()) {
        jsonObject = data.object();
        m_jsonMap = jsonObject.toVariantMap();
    }
}

QString InfoData::component() const
{
    return m_component;
}

QString InfoData::higUrl() const
{
    return m_higUrl;
}

QString InfoData::sourceUrl() const
{
    return m_sourceUrl;
}

QString InfoData::apiUrl() const
{
    return m_apiUrl;
}

QString InfoData::title() const
{
    return m_title;
}

QString InfoData::text() const
{
    return m_text;
}

void InfoData::setComponent(const QString &componentName)
{
    if (componentName != m_component) {
        m_component = componentName;
        Q_EMIT componentChanged();
        m_jsonMap.contains(componentName) ? setComponentData() : clearComponentData();
    }
}

void InfoData::clearComponentData()
{
    m_sourceUrl = QString();
    m_higUrl = QString();
    m_apiUrl = QString();
    m_title = QString();
    m_text = QString();
}

void InfoData::setComponentData()
{
    QVariantMap componentVariant = qvariant_cast<QVariantMap>(m_jsonMap[m_component]);

    if (!componentVariant.isEmpty()) {
        m_sourceUrl = componentVariant.contains(QStringLiteral("sourceUrl")) ? componentVariant[QStringLiteral("sourceUrl")].toString() : QString();
        sourceUrlChanged();
        m_higUrl = componentVariant.contains(QStringLiteral("higUrl")) ? componentVariant[QStringLiteral("higUrl")].toString() : QString();
        higUrlChanged();
        m_apiUrl = componentVariant.contains(QStringLiteral("apiUrl")) ? componentVariant[QStringLiteral("apiUrl")].toString() : QString();
        apiUrlChanged();
        m_title = componentVariant.contains(QStringLiteral("title")) ? componentVariant[QStringLiteral("title")].toString() : QString();
        titleChanged();
        m_text = componentVariant.contains(QStringLiteral("text")) ? componentVariant[QStringLiteral("text")].toString() : QString();
        textChanged();
    }
}
