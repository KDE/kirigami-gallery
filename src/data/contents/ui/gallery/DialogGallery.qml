/*
 *   Copyright 2021 Devin Lin <espidev@gmail.com>
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
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.19 as Kirigami

import "components" as KGC

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    //implicitWidth: Kirigami.Units.gridUnit * (Math.floor(Math.random() * 35) + 10)

    title: qsTr("Dialogs")

    actions: Kirigami.Action {
        icon.name: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.visible = checked;
        shortcut: "Alt+I"
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.visible) {
            event.accepted = true;
            sheet.close();
        }
    }

    KGC.InfoSheet {
        id: sheet

        page: page
        component: "DialogGallery"
    }

    Kirigami.PromptDialog {
        id: promptDialog
        title: "Reset settings?"
        subtitle: "The stored settings for the application will be deleted, with the defaults restored."
        standardButtons: Kirigami.Dialog.Ok | Kirigami.Dialog.Cancel

        onAccepted: showPassiveNotification("Accepted")
        onRejected: console.log("Rejected")
    }

    Kirigami.PromptDialog {
        id: textPromptDialog
        title: "New Folder"

        standardButtons: Kirigami.Dialog.NoButton
        customFooterActions: [
            Kirigami.Action {
                text: qsTr("Create Folder")
                icon.name: "dialog-ok"
                onTriggered: {
                    showPassiveNotification("Created");
                    textPromptDialog.close();
                }
            },
            Kirigami.Action {
                text: qsTr("Cancel")
                icon.name: "dialog-cancel"
                onTriggered: {
                    textPromptDialog.close();
                }
            }
        ]

        QQC2.TextField {
            placeholderText: qsTr("Folder name…")
        }
    }

    Kirigami.Dialog {
        id: selectDialog
        title: qsTr("Alarm Snooze Length")
        preferredWidth: Kirigami.Units.gridUnit * 16

        ColumnLayout {
            spacing: 0
            Repeater {
                model: ListModel {
                    // we can't use qsTr/i18n with ListElement
                    Component.onCompleted: {
                        append({"name": qsTr("1 minute"), "value": 1});
                        append({"name": qsTr("2 minutes"), "value": 2});
                        append({"name": qsTr("3 minutes"), "value": 3});
                        append({"name": qsTr("4 minutes"), "value": 4});
                        append({"name": qsTr("5 minutes"), "value": 5});
                        append({"name": qsTr("10 minutes"), "value": 10});
                        append({"name": qsTr("30 minutes"), "value": 30});
                        append({"name": qsTr("1 hour"), "value": 60});
                    }
                }
                delegate: QQC2.RadioDelegate {
                    Layout.fillWidth: true
                    topPadding: Kirigami.Units.smallSpacing * 2
                    bottomPadding: Kirigami.Units.smallSpacing * 2

                    text: name
                    checked: value == 1
                    onCheckedChanged: {
                        if (checked) {
                            showPassiveNotification("Selected " + name + " with value " + value);
                        }
                    }
                }
            }
        }
    }

    Kirigami.Dialog {
        id: scrollableDialog
        title: qsTr("Select Number")

        ListView {
            id: listView
            implicitWidth: Kirigami.Units.gridUnit * 16
            implicitHeight: Kirigami.Units.gridUnit * 16
            leftMargin: 0; rightMargin: 0; topMargin: 0; bottomMargin: 0;

            model: 100
            delegate: QQC2.RadioDelegate {
                topPadding: Kirigami.Units.smallSpacing * 2
                bottomPadding: Kirigami.Units.smallSpacing * 2
                implicitWidth: listView.width
                text: modelData
            }
        }
    }

    Kirigami.PromptDialog {
        id: noFooterDialog
        title: qsTr("No Footer Dialog")
        subtitle: qsTr("This dialog has no footer buttons.<br/>It also has no close button.")

        standardButtons: Kirigami.Dialog.NoButton
        showCloseButton: false
    }

    Kirigami.MenuDialog {
        id: menuDialog
        title: qsTr("Track Options")

        actions: [
            Kirigami.Action {
                icon.name: "media-playback-start"
                text: qsTr("Play", "Start playback of the selected track")
                tooltip: qsTr("Start playback of the selected track")
            },
            Kirigami.Action {
                enabled: false
                icon.name: "document-open-folder"
                text: qsTr("Show in folder", "Show the file for this song in the file manager")
                tooltip: qsTr("Show the file for this song in the file manager")
            },
            Kirigami.Action {
                icon.name: "documentinfo"
                text: qsTr("View details", "Show track metadata")
                tooltip: qsTr("Show track metadata")
            },
            Kirigami.Action {
                icon.name: "list-add"
                text: qsTr("Play next", "Add the track to the queue, right after the current track")
                tooltip: qsTr("Add the track to the queue, right after the current track")
            },
            Kirigami.Action {
                icon.name: "list-add"
                text: qsTr("Add to queue", "Enqueue current track")
                tooltip: qsTr("Enqueue current track")
            }
        ]
    }

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        QQC2.Button {
            text: qsTr("Prompt Dialog")
            Layout.alignment: Qt.AlignHCenter
            onClicked: promptDialog.open()
        }
        QQC2.Button {
            text: qsTr("Text Prompt Dialog")
            Layout.alignment: Qt.AlignHCenter
            onClicked: textPromptDialog.open()
        }
        QQC2.Button {
            text: qsTr("Selection Dialog")
            Layout.alignment: Qt.AlignHCenter
            onClicked: selectDialog.open()
        }
        QQC2.Button {
            text: qsTr("Scrollable Dialog")
            Layout.alignment: Qt.AlignHCenter
            onClicked: scrollableDialog.open()
        }
        QQC2.Button {
            text: qsTr("No Footer Dialog")
            Layout.alignment: Qt.AlignHCenter
            onClicked: noFooterDialog.open()
        }
        QQC2.Button {
            text: qsTr("Menu Dialog")
            Layout.alignment: Qt.AlignHCenter
            onClicked: menuDialog.open()
        }
    }
}

