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

import QtQuick 2.0
import QtQuick.Controls 2.2 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

import "components"

Kirigami.ScrollablePage {
    id: page

    title: qsTr("Drawers")

    actions{
        main: Kirigami.Action {
            iconName: "documentinfo"
            text: qsTr("Info")
            checkable: true
            onCheckedChanged: sheet.sheetOpen = checked;
            shortcut: "Alt+I"
        }
        contextualActions: [
            Kirigami.Action {
                text: qsTr("Action 1")
                iconName: "bookmarks"
                onTriggered: showPassiveNotification(qsTr("Action 1 clicked"))
            },
            Kirigami.Action {
                text: qsTr("Disabled Action")
                iconName: "folder"
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

    InfoSheet {
        id: sheet

        page: page
        component: "DrawerGallery"
    }

    Kirigami.OverlayDrawer {
        id: modalBottomDrawer
        edge: Qt.BottomEdge
        contentItem: ColumnLayout {
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A modal bottom drawer will span for the whole application window width and will darken the rest of the app. Clicking on a darkened will dismiss the drawer.")
            }
            Controls.Button {
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
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("An inline top drawer covers the whole application width but lets the uncovered pieces to still be interacted with.")
            }
            Controls.Button {
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
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A modal top drawer will span for the whole application window width and will darken the rest of the app. Clicking on the darkened area will dismiss the drawer.")
            }
            Controls.Button {
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
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("An inline bottom drawer covers the whole application width but lets the uncovered pieces to still be interacted with.")
            }
            Controls.Button {
                Layout.alignment: Qt.AlignRight
                text: qsTr("Close")
                onClicked: inlineTopDrawer.close()
            }
        }
    }

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        Controls.Button {
            text: qsTr("Left Global Drawer")
            Layout.alignment: Qt.AlignHCenter
            onClicked: applicationWindow().globalDrawer.open()
        }
        Controls.Button {
            text: qsTr("Right Context Drawer")
            Layout.alignment: Qt.AlignHCenter
            visible: applicationWindow().contextDrawer
            onClicked: applicationWindow().contextDrawer.open()
        }
        Controls.Button {
            text: qsTr("Modal Bottom Drawer")
            Layout.alignment: Qt.AlignHCenter
            onClicked: modalBottomDrawer.open()
        }
        Controls.Button {
            text: "Inline Bottom Drawer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: inlineBottomDrawer.open()
        }
        Controls.Button {
            text: qsTr("Modal Top Drawer")
            Layout.alignment: Qt.AlignHCenter
            onClicked: modalTopDrawer.open()
        }
        Controls.Button {
            text: "Inline Top Drawer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: inlineTopDrawer.open()
        }
    }
}
