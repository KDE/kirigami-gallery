/*
 *   Copyright 2018 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.19 as Kirigami
import Data 1.0

Kirigami.PromptDialog {
    id: root
    property Kirigami.Page page
    property url higUrl: infoData.higUrl
    property url sourceUrl: infoData.sourceUrl
    property url apiUrl: infoData.apiUrl
    property string text: infoData.text
    property alias component: infoData.component

    title: infoData.title
    subtitle: text
    preferredWidth: Kirigami.Units.gridUnit * 20
    onVisibleChanged: page.actions[0].checked = visible
    flatFooterButtons: true
    
    property var info: InfoData {
        id: infoData
    }
    
    standardButtons: Kirigami.Dialog.NoButton
    customFooterActions: [
        Kirigami.Action {
            text: qsTr("HIG...")
            enabled: higUrl != ""
            onTriggered: Qt.openUrlExternally(higUrl);
        },
        Kirigami.Action {
            text: qsTr("Source code...")
            enabled: sourceUrl != ""
            onTriggered: Qt.openUrlExternally(sourceUrl)
        },
        Kirigami.Action {
            text: qsTr("API...")
            enabled: apiUrl != ""
            onTriggered: Qt.openUrlExternally(apiUrl)
        }
    ]
}
