/*
 *   Copyright 2021 Devin Lin <espidev@gmail.com>
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

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    //implicitWidth: Kirigami.Units.gridUnit * (Math.floor(Math.random() * 35) + 10)

    title: qsTr("Dialogs")

    actions: KGC.InfoSheetAction {
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
            placeholderText: qsTr("Folder name...")
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
                    required property string name
                    required property int value

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
        id: subtitleDialog
        title: qsTr("Select Number")
        implicitWidth: Kirigami.Units.gridUnit * 16

        ColumnLayout {
            Repeater {
                model: 5
                delegate: Kirigami.RadioSubtitleDelegate {
                    required property int index

                    subtitle: qsTr("Subtitle text")
                    text: index
                    Layout.fillWidth: true
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
                required property int index

                topPadding: Kirigami.Units.smallSpacing * 2
                bottomPadding: Kirigami.Units.smallSpacing * 2
                implicitWidth: listView.width
                text: index
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

        contentHeaderControl: Rectangle {
            height: 50
            color: "green"
        }

        QQC2.ButtonGroup {
            id: radioGroup
        }

        actions: [
            Kirigami.Action {
                icon.name: "checkmark"
                text: qsTr("A normal action")
                tooltip: qsTr("A normal action")
            },
            Kirigami.Action {
                enabled: false
                icon.name: "action-unavailable-symbolic"
                text: qsTr("A disabled action")
                tooltip: qsTr("A disabled action")
            },
            Kirigami.Action {
                separator: true
            },
            Kirigami.Action {
                QQC2.ButtonGroup.group: radioGroup
                checked: true
                checkable: true
                autoExclusive: true
                text: qsTr("Radio 1", "The first radio button")
                tooltip: qsTr("Radio 1")
            },
            Kirigami.Action {
                QQC2.ButtonGroup.group: radioGroup
                checkable: true
                autoExclusive: true
                text: qsTr("Radio 2", "The second radio button")
                tooltip: qsTr("Radio 2")
            },
            Kirigami.Action {
                QQC2.ButtonGroup.group: radioGroup
                checkable: true
                autoExclusive: true
                text: qsTr("Radio 3", "The third radio button")
                tooltip: qsTr("Radio 3")
            },
            Kirigami.Action {
                checkable: true
                text: qsTr("Check button", "An example checkable button")
                tooltip: qsTr("Check button")
            },
            Kirigami.Action {
                displayComponent: QQC2.Label {
                    leftPadding: Kirigami.Units.smallSpacing
                    rightPadding: Kirigami.Units.smallSpacing
                    text: qsTr("This is a custom displayComponent component from the action with a red background")
                    wrapMode: Text.Wrap
                    background: Rectangle {
                        color: "red"
                    }
                }
            },
            Kirigami.Action {
                separator: true
            },
            Kirigami.Action {
                icon.name: "list-add"
                text: qsTr("With Children", "I.e. an example where the item has child items")
                tooltip: qsTr("With Children")
                children: [
                    Kirigami.Action {
                        icon.name: "user"
                        text: qsTr("Child 1")
                        tooltip: qsTr("Child 1")
                    },
                    Kirigami.Action {
                        icon.name: "user"
                        text: qsTr("Child 2")
                        tooltip: qsTr("Child 2")
                    }
                ]
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
            text: qsTr("Selection Dialog with subtitles")
            Layout.alignment: Qt.AlignHCenter
            onClicked: subtitleDialog.open()
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

