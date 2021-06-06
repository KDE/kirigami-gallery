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
import org.kde.kirigami 2.4 as Kirigami
import Data 1.0

Kirigami.OverlaySheet {
    id: root
    property Kirigami.Page page
    property url higUrl: infoData.higUrl
    property url sourceUrl: infoData.sourceUrl
    property url apiUrl: infoData.apiUrl
    property alias title: titleLabel.text
    property alias text: mainText.text
    property alias component: infoData.component

    onSheetOpenChanged: page.actions.main.checked = sheetOpen
    header: Kirigami.Heading {
        id: titleLabel

        level: 2
        text: infoData.title
        Layout.fillWidth: true

        InfoData {
            id: infoData
        }
    }

    footer: RowLayout {
        Item {
            Layout.fillWidth: true
        }
        Controls.ToolButton {
            text: qsTr("HIG...")
            enabled: higUrl != ""
            onClicked: Qt.openUrlExternally(higUrl)
        }
        Controls.ToolButton {
            text: qsTr("Source code...")
            enabled: sourceUrl != ""
            onClicked: Qt.openUrlExternally(sourceUrl)
        }
        Controls.ToolButton {
            text: qsTr("API...")
            enabled: apiUrl != ""
            onClicked: Qt.openUrlExternally(apiUrl)
        }
    }

    Controls.Label {
        id: mainText
        text: infoData.text
        property int implicitWidth: Kirigami.Units.gridUnit * 25
        wrapMode: Text.WordWrap
    }
}
