/*
 *   Copyright 2015 Marco Martin <mart@kde.org>
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

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.15 as Kirigami

Kirigami.ScrollablePage {
    id: page

    title: "Buttons"

    ColumnLayout {
        anchors.centerIn: parent

        QQC2.ComboBox {
            Layout.alignment: Qt.AlignHCenter
            textRole: "text"
            model: [{"text": "Default", "value": -1},
                    {"text": "First Option", "value": 0},
                    {"text": "Second Option", "value": 1},
                    {"text": "None", "value": 2}]
        }
        QQC2.ToolButton {
            text: "Off"
            checkable: true
            checked: true
            Layout.alignment: Qt.AlignHCenter
            onCheckedChanged: {
                if (checked) {
                    text = "Off"
                } else {
                    text = "On"
                }
            }
        }
        QQC2.Button {
            text: "Disabled Button"
            enabled: false
            Layout.alignment: Qt.AlignHCenter
        }
        QQC2.ToolButton {
            text: "Tool Button"
            icon.name: "go-next"
            Layout.alignment: Qt.AlignHCenter
        }
        QQC2.ToolButton {
            text: "Tool Button non flat"
            flat: false
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
