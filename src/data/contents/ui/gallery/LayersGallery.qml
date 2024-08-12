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

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    //implicitWidth: Kirigami.Units.gridUnit * (Math.floor(Math.random() * 35) + 8)

    title: "Layers"

    actions: [
        Kirigami.Action {
            icon.name: "document-edit"
            text: "Main Action Text"
            onTriggered: source => {
                showPassiveNotification("Action button in buttons page clicked");
            }
        },
        Kirigami.Action {
            icon.name: "go-previous"
            text: "Left Action Text"
            onTriggered: source => {
                showPassiveNotification("Left action triggered");
            }
        },
        Kirigami.Action {
            text: "Action 1"
            icon.name: "go-next"
            onTriggered: source => {
                showPassiveNotification("Action 1 clicked");
            }
        },
        Kirigami.Action {
            text: "Action 2"
            icon.name: "folder"
            enabled: false
            onTriggered: source => {
                showPassiveNotification("Action 2 clicked");
            }
        }
    ]

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        QQC2.Label {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: "This page is used to test multiple layers: it will cover all the columns"
        }

        QQC2.Button {
            text: "Push A New Layer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageStack.layers.push(Qt.resolvedUrl("LayersGallery.qml"));
        }
        QQC2.Button {
            text: "Pop A Layer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageStack.layers.pop();
        }
        QQC2.Button {
            text: "Toggle header"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                if (page.globalToolBarStyle == Kirigami.ApplicationHeaderStyle.None) {
                    page.globalToolBarStyle = Kirigami.ApplicationHeaderStyle.ToolBar;
                }
                else {
                    page.globalToolBarStyle = Kirigami.ApplicationHeaderStyle.None;
                }
            }
        }
    }
}
