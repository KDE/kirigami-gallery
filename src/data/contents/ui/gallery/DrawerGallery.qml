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

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.20 as Kirigami

import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    title: qsTr("Drawers")

    actions{
        main: Kirigami.Action {
            icon.name: "documentinfo"
            text: qsTr("Info")
            checkable: true
            onCheckedChanged: sheet.visible = checked;
            shortcut: "Alt+I"
        }
        contextualActions: [
            Kirigami.Action {
                text: qsTr("Action 1")
                icon.name: "bookmarks"
                onTriggered: showPassiveNotification(qsTr("Action 1 clicked"))
            },
            Kirigami.Action {
                text: qsTr("Disabled Action")
                icon.name: "folder"
                enabled: false
            },
            Kirigami.Action {
                text: qsTr("Action 3")
                onTriggered: showPassiveNotification(qsTr("Action 3 clicked"))
            }
        ]
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.sheetOpen) {
            event.accepted = true;
            sheet.close();
        }
    }

    KGC.InfoSheet {
        id: sheet

        page: page
        component: "DrawerGallery"
    }

    Kirigami.OverlayDrawer {
        id: modalBottomDrawer
        edge: Qt.BottomEdge
        contentItem: ColumnLayout {
            QQC2.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A modal bottom drawer will span for the whole application window width and will darken the rest of the app. Clicking on a darkened will dismiss the drawer.")
            }
            QQC2.Button {
                Layout.alignment: Qt.AlignRight
                text: qsTr("Close")
                onClicked: modalBottomDrawer.close()
            }
        }
    }

    Kirigami.OverlayDrawer {
        id: inlineBottomDrawer
        edge: Qt.BottomEdge
        modal: false

        contentItem: ColumnLayout {
            QQC2.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("An inline bottom drawer covers the whole application width but lets the uncovered pieces to still be interacted with.")
            }
            QQC2.Button {
                Layout.alignment: Qt.AlignRight
                text: qsTr("Close")
                onClicked: inlineBottomDrawer.close()
            }
        }
    }

    Kirigami.OverlayDrawer {
        id: modalTopDrawer
        edge: Qt.TopEdge
        contentItem: ColumnLayout {
            QQC2.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A modal top drawer will span for the whole application window width and will darken the rest of the app. Clicking on the darkened area will dismiss the drawer.")
            }
            QQC2.Button {
                Layout.alignment: Qt.AlignRight
                text: qsTr("Close")
                onClicked: modalTopDrawer.close()
            }
        }
    }

    Kirigami.OverlayDrawer {
        id: inlineTopDrawer
        edge: Qt.TopEdge
        modal: false

        contentItem: ColumnLayout {
            QQC2.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("An inline top drawer covers the whole application width but lets the uncovered pieces to still be interacted with.")
            }
            QQC2.Button {
                Layout.alignment: Qt.AlignRight
                text: qsTr("Close")
                onClicked: inlineTopDrawer.close()
            }
        }
    }

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        QQC2.Button {
            text: qsTr("Left Global Drawer")
            Layout.alignment: Qt.AlignHCenter
            onClicked: applicationWindow().globalDrawer.open()
        }
        QQC2.Button {
            text: qsTr("Right Context Drawer")
            Layout.alignment: Qt.AlignHCenter
            visible: applicationWindow().contextDrawer
            onClicked: applicationWindow().contextDrawer.open()
        }
        QQC2.Button {
            text: qsTr("Modal Bottom Drawer")
            Layout.alignment: Qt.AlignHCenter
            onClicked: modalBottomDrawer.open()
        }
        QQC2.Button {
            text: "Inline Bottom Drawer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: inlineBottomDrawer.open()
        }
        QQC2.Button {
            text: qsTr("Modal Top Drawer")
            Layout.alignment: Qt.AlignHCenter
            onClicked: modalTopDrawer.open()
        }
        QQC2.Button {
            text: "Inline Top Drawer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: inlineTopDrawer.open()
        }
    }
}
