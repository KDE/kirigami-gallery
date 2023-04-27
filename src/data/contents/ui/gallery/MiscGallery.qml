/*
 *   Copyright 2016 Aleix Pol Gonzalez <aleixpol@kde.org>
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
import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.20

ScrollablePage {
    id: page
    title: "Misc controls"

    actions {
        main: Action {
            icon.name: "document-edit"
            icon.color: Theme.negativeTextColor
            text: "Main Action Text"
        }
        left: Action {
            icon.name: "go-previous"
            icon.color: Theme.positiveTextColor
            enabled: false
            text: "Left Action Text"
            onTriggered: {
                showPassiveNotification("Left action triggered")
            }
        }
        right: Action {
            icon.name: "go-next"
            icon.color: Theme.neutralTextColor
            text: "Right Action Text"
            onTriggered: {
                showPassiveNotification("Right action triggered")
            }
        }
        contextualActions: [
            Action {
                text:"Action for buttons"
                icon.name: "bookmarks"
                icon.color: Theme.activeTextColor
                onTriggered: showPassiveNotification("Action 1 clicked")
            },
            Action {
                text:"Disabled Action"
                icon.name: "folder"
                enabled: false
            }
        ]
    }

    header: Controls.ToolBar {
        contentItem: ActionToolBar {
            id: actionToolBar
            actions: [
                Action {
                    id: textBesideAction
                    icon.name: "document-edit"
                    text: qsTr("Text Beside Icon")
                    checkable: true
                    checked: true
                    onCheckedChanged: {
                        if (checked) {
                            actionToolBar.display = Controls.Button.TextBesideIcon;
                            textUnderAction.checked = false;
                            textOnlyAction.checked = false;
                            iconOnlyAction.checked = false;
                        }
                    }
                },
                Action {
                    id: textUnderAction
                    icon.name: "document-edit"
                    text: qsTr("Text Under Icon")
                    checkable: true
                    checked: false
                    onCheckedChanged: {
                        if (checked) {
                            actionToolBar.display = Controls.Button.TextUnderIcon;
                            textBesideAction.checked = false;
                            textOnlyAction.checked = false;
                            iconOnlyAction.checked = false;
                        }
                    }
                },
                Action {
                    id: textOnlyAction
                    icon.name: "document-edit"
                    text: qsTr("Text Only")
                    checkable: true
                    checked: false
                    onCheckedChanged:  {
                        if (checked) {
                            actionToolBar.display = Controls.Button.TextOnly;
                            textUnderAction.checked = false;
                            textBesideAction.checked = false;
                            iconOnlyAction.checked = false;
                        }
                    }
                },
                Action {
                    id: iconOnlyAction
                    icon.name: "document-edit"
                    text: qsTr("Icon Only")
                    checkable: true
                    checked: false
                    onCheckedChanged:  {
                        if (checked) {
                            actionToolBar.display = Controls.Button.IconOnly;
                            textUnderAction.checked = false;
                            textOnlyAction.checked = false;
                            textBesideAction.checked = false;
                        }
                    }
                },
                Action {
                    icon.name: "document-edit"
                    text: "Action 5"
                    displayHint: DisplayHint.AlwaysHide
                },
                Action {
                    icon.name: "document-edit"
                    text: "Action 6"
                    displayHint: DisplayHint.AlwaysHide
                },
                Action {
                    icon.name: "document-edit"
                    text: "Action 7"
                    displayHint: DisplayHint.AlwaysHide
                }
            ]
        }
    }

    footer: Rectangle {
        color: Theme.backgroundColor
        height: Units.gridUnit * 3
        Controls.TextField {
            topPadding: 0
            bottomPadding: 0
            leftPadding: Units.smallSpacing
            rightPadding: Units.smallSpacing
            anchors.fill: parent
        }
        Separator {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
        }
    }

    Controls.Dialog {
        id: dialog
        modal: true
        focus: true
        x: (page.width - width) / 2
        y: page.height / 2 - height
        width: Math.min(page.width - Units.gridUnit * 4, Units.gridUnit * 20)
        standardButtons: Controls.Dialog.Ok
        title: "Title"

        Controls.Label {
            width: dialog.availableWidth
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor."
            wrapMode: Text.Wrap
        }

    }

    ColumnLayout {
        anchors.centerIn: parent
        Controls.Button {
            Layout.alignment: Qt.AlignHCenter
            text: "Dialog"
            onClicked: dialog.open()
        }
        Controls.Dial {
            Layout.alignment: Qt.AlignHCenter
        }
        Controls.SpinBox {
            editable: true
            Layout.alignment: Qt.AlignHCenter
        }
        Controls.ComboBox {
            model: ["First", "Second", "Third"]
            Layout.alignment: Qt.AlignHCenter
        }
        Controls.ComboBox {
            editable: true
            model: ["First", "Second", "Third"]
            Layout.alignment: Qt.AlignHCenter
        }
        Controls.GroupBox {
            title: "Title"
            Layout.alignment: Qt.AlignHCenter

            ColumnLayout {
                id: options

                Controls.RadioButton {
                    text: "First"
                    checked: true
                }
                Controls.RadioButton {
                    text: "Second"
                    checked: false
                }
                Controls.RadioButton {
                    text: "Third"
                    checked: false
                }
            }
        }
        Controls.Label {
            Layout.alignment: Qt.AlignHCenter
            text: Settings.isMobile ? "We are in mobile device mode" : "We are not in mobile device mode"
        }
        Controls.Label {
            Layout.alignment: Qt.AlignHCenter
            text: Settings.tabletMode ? "We are in tablet mode" : "We are not in tablet mode"
        }
        Column {
            Layout.alignment: Qt.AlignHCenter
            Controls.ItemDelegate {
                width: 300
                text: "Delegate1"
            }
            Controls.ItemDelegate {
                width: 300
                text: "Delegate2"
            }
            Controls.CheckDelegate {
                width: 300
                text: "Delegate3"
            }
            Controls.SwitchDelegate {
                width: 300
                text: "Delegate4"
            }
            Controls.RadioDelegate {
                width: 300
                text: "Delegate5"
            }
        }
    }
}
