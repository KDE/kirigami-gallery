// SPDX-FileCopyrightText: 2016 Aleix Pol Gonzalez <aleixpol@kde.org>
// SPDX-FileCopyrightText: 2023 Carl Schwan <carl@carlschwan.eu>
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2
import QtQuick.Controls 2 as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: page
    title: "Misc QQC2"

    actions: [
         Kirigami.Action {
            icon.name: "document-edit"
            icon.color: Theme.negativeTextColor
            text: "Main Action Text"
        },
        Kirigami.Action {
            icon.name: "go-previous"
            icon.color: Theme.positiveTextColor
            enabled: false
            text: "Left Action Text"
            onTriggered: showPassiveNotification("Left action triggered")
        },
        Kirigami.Action {
            icon.name: "go-next"
            icon.color: Theme.neutralTextColor
            text: "Right Action Text"
            onTriggered: showPassiveNotification("Right action triggered")
        },
        Kirigami.Action {
            text:"Action for buttons"
            icon.name: "bookmarks"
            icon.color: Theme.activeTextColor
            onTriggered: showPassiveNotification("Action 1 clicked")
        },
        Kirigami.Action {
            text:"Disabled Action"
            icon.name: "folder"
            enabled: false
        }
    ]

    header: QQC2.ToolBar {
        contentItem: Kirigami.ActionToolBar {
            id: actionToolBar
            actions: [
                Kirigami.Action {
                    id: textBesideAction
                    icon.name: "document-edit"
                    text: qsTr("Text Beside Icon")
                    checkable: true
                    checked: true
                    onCheckedChanged: {
                        if (checked) {
                            actionToolBar.display = QQC2.Button.TextBesideIcon;
                            textUnderAction.checked = false;
                            textOnlyAction.checked = false;
                            iconOnlyAction.checked = false;
                        }
                    }
                },
                Kirigami.Action {
                    id: textUnderAction
                    icon.name: "document-edit"
                    text: qsTr("Text Under Icon")
                    checkable: true
                    checked: false
                    onCheckedChanged: {
                        if (checked) {
                            actionToolBar.display = QQC2.Button.TextUnderIcon;
                            textBesideAction.checked = false;
                            textOnlyAction.checked = false;
                            iconOnlyAction.checked = false;
                        }
                    }
                },
                Kirigami.Action {
                    id: textOnlyAction
                    icon.name: "document-edit"
                    text: qsTr("Text Only")
                    checkable: true
                    checked: false
                    onCheckedChanged:  {
                        if (checked) {
                            actionToolBar.display = QQC2.Button.TextOnly;
                            textUnderAction.checked = false;
                            textBesideAction.checked = false;
                            iconOnlyAction.checked = false;
                        }
                    }
                },
                Kirigami.Action {
                    id: iconOnlyAction
                    icon.name: "document-edit"
                    text: qsTr("Icon Only")
                    checkable: true
                    checked: false
                    onCheckedChanged:  {
                        if (checked) {
                            actionToolBar.display = QQC2.Button.IconOnly;
                            textUnderAction.checked = false;
                            textOnlyAction.checked = false;
                            textBesideAction.checked = false;
                        }
                    }
                },
                Kirigami.Action {
                    icon.name: "document-edit"
                    text: "Action 5"
                    displayHint: DisplayHint.AlwaysHide
                },
                Kirigami.Action {
                    icon.name: "document-edit"
                    text: "Action 6"
                    displayHint: DisplayHint.AlwaysHide
                },
                Kirigami.Action {
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
        QQC2.TextField {
            topPadding: 0
            bottomPadding: 0
            leftPadding: Units.smallSpacing
            rightPadding: Units.smallSpacing
            anchors.fill: parent
        }
        Kirigami.Separator {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
        }
    }

    QQC2.Dialog {
        id: dialog
        modal: true
        focus: true
        x: (page.width - width) / 2
        y: page.height / 2 - height
        width: Math.min(page.width - Units.gridUnit * 4, Units.gridUnit * 20)
        standardButtons: QQC2.Dialog.Ok
        title: "Title"

        QQC2.Label {
            width: dialog.availableWidth
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor."
            wrapMode: Text.Wrap
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        QQC2.Button {
            Layout.alignment: Qt.AlignHCenter
            text: "Dialog"
            onClicked: dialog.open()
        }
        QQC2.Dial {
            Layout.alignment: Qt.AlignHCenter
        }
        QQC2.SpinBox {
            editable: true
            Layout.alignment: Qt.AlignHCenter
        }
        QQC2.ComboBox {
            model: ["First", "Second", "Third"]
            Layout.alignment: Qt.AlignHCenter
        }
        QQC2.ComboBox {
            editable: true
            model: ["First", "Second", "Third"]
            Layout.alignment: Qt.AlignHCenter
        }
        QQC2.GroupBox {
            title: "Title"
            Layout.alignment: Qt.AlignHCenter

            ColumnLayout {
                id: options

                QQC2.RadioButton {
                    text: "First"
                    checked: true
                }
                QQC2.RadioButton {
                    text: "Second"
                    checked: false
                }
                QQC2.RadioButton {
                    text: "Third"
                    checked: false
                }
            }
        }
        QQC2.Label {
            Layout.alignment: Qt.AlignHCenter
            text: Settings.isMobile ? "We are in mobile device mode" : "We are not in mobile device mode"
        }
        QQC2.Label {
            Layout.alignment: Qt.AlignHCenter
            text: Settings.tabletMode ? "We are in tablet mode" : "We are not in tablet mode"
        }
        Column {
            Layout.alignment: Qt.AlignHCenter
            QQC2.ItemDelegate {
                width: 300
                text: "Delegate1"
            }
            QQC2.ItemDelegate {
                width: 300
                text: "Delegate2"
            }
            QQC2.CheckDelegate {
                width: 300
                text: "Delegate3"
            }
            QQC2.SwitchDelegate {
                width: 300
                text: "Delegate4"
            }
            QQC2.RadioDelegate {
                width: 300
                text: "Delegate5"
            }
        }
    }
}
