/*
 *   Copyright 2018 Eike Hein <mart@kde.org>
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

    title: qsTr("Inline Messages")

    actions: Kirigami.Action {
        icon.name: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.visible = checked;
        shortcut: "Alt+I"
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
        component: "InlineMessagesGallery"
    }

    ColumnLayout {
        spacing: Kirigami.Units.largeSpacing

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            text: qsTr("This is an informational inline message (the default type). Use it for example to announce a result or provide commentary.")
        }

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            type: Kirigami.MessageType.Positive

            text: qsTr("This is a positive inline message. Use it for example to announce a successful result or the successful completion of a procedure.")
        }

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            type: Kirigami.MessageType.Warning

            text: qsTr("This is a warning inline message. Use it for example to provide critical guidance or warn about something that is not going to work.")
        }

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            type: Kirigami.MessageType.Error

            text: qsTr("This is an error inline message. Use it for example to announce something has gone wrong or that input will not be accepted.")
        }

        Kirigami.Separator {
            Layout.fillWidth: true
        }

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            icon.source: "system-run"

            text: qsTr("Inline messages can optionally have a custom icon set.")
        }

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            text: qsTr("You can use rich text in inline messages and optionally handle clicks on links (opens in browser): <a href=\"https://www.kde.org\">https://www.kde.org/<a/>")

            onLinkActivated: link => Qt.openUrlExternally(link)
        }

        Kirigami.InlineMessage {
            Layout.fillWidth: true

            visible: true

            showCloseButton: true

            text: qsTr("Inline messages can have an optional close button.")
        }

        Kirigami.InlineMessage {
            id: actionsMessage

            Layout.fillWidth: true

            visible: true

            readonly property string initialText: "Inline messages can have optional actions."

            text: initialText

            actions: [
                Kirigami.Action {
                    enabled: actionsMessage.text == actionsMessage.initialText

                    text: qsTr("Add text")
                    icon.name: "list-add"

                    onTriggered: {
                        actionsMessage.text = actionsMessage.initialText + " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
                    }
                },
                Kirigami.Action {
                    enabled: actionsMessage.text != actionsMessage.initialText

                    text: qsTr("Reset text")
                    icon.name: "list-remove"

                    onTriggered: actionsMessage.text = actionsMessage.initialText
                }
            ]
        }

        Kirigami.Separator {
            Layout.fillWidth: true
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.minimumWidth: 1

            spacing: Kirigami.Units.smallSpacing

            QQC2.Label {
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter

                text: qsTr("Inline messages are initially hidden and animate when revealed. Try it!")
                wrapMode: Text.WordWrap
            }

            QQC2.Button {
                Layout.alignment: Qt.AlignHCenter

                enabled: !toggleMessage.visible

                text: qsTr("Show additional message")
                //TODO: enable when we can depend from Qt 5.10
               // icon.name: "list-add"

                onClicked: toggleMessage.visible = true
            }
        }

        Kirigami.InlineMessage {
            id: toggleMessage

            Layout.fillWidth: true

            visible: false

            type: Kirigami.MessageType.Warning

            text: qsTr("Boo!")

            actions: [
                Kirigami.Action {
                    text: qsTr("Shush")
                    icon.name: "dialog-cancel"

                    onTriggered: toggleMessage.visible = false
                }
            ]
        }

    }
}
