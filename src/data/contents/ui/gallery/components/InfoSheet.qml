/*
 *   Copyright 2018 Marco Martin <mart@kde.org>
 *   Copyright 2024 ivan tkachenko <me@ratijas.tk>
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

import QtQuick
import org.kde.kirigami as Kirigami
import Data

Kirigami.PromptDialog {
    id: root

    required property string component

    readonly property InfoData info: InfoData {
        id: infoData

        component: root.component
    }

    title: infoData.title
    subtitle: infoData.text
    preferredWidth: Kirigami.Units.gridUnit * 20
    flatFooterButtons: true

    standardButtons: Kirigami.Dialog.NoButton
    customFooterActions: [
        Kirigami.Action {
            text: qsTr("HIG…")
            enabled: infoData.higUrl.toString() !== ""
            onTriggered: Qt.openUrlExternally(infoData.higUrl)
        },
        Kirigami.Action {
            text: qsTr("Source code…")
            enabled: infoData.sourceUrl.toString() !== ""
            onTriggered: Qt.openUrlExternally(infoData.sourceUrl)
        },
        Kirigami.Action {
            text: qsTr("API…")
            enabled: infoData.apiUrl.toString() !== ""
            onTriggered: Qt.openUrlExternally(infoData.apiUrl)
        }
    ]
}
