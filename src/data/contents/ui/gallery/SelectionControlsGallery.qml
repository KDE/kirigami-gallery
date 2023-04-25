/*
 *   Copyright 2015 Marco Martin <mart@kde.org>
 *   Copyright 2022 ivan tkachenko <me@ratijas.tk>
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
import org.kde.kirigami 2.4 as Kirigami

import "components"

Kirigami.ScrollablePage {
    id: page
    actions: Kirigami.Action {
        icon.name: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.visible = checked;
        shortcut: "Alt+I"
    }

    Layout.fillWidth: true
    title: qsTr("Selection Controls")

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.visible) {
            event.accepted = true;
            sheet.close();
        }
    }

    InfoSheet {
        id: sheet

        page: page
        component: "SelectionControlsGallery"
    }

    Controls.Dialog {
        id: checkListDialog
        modal: true
        focus: true
        x: (page.width - width) / 2
        y: page.height / 2 - height
        width: Math.min(page.width - Kirigami.Units.gridUnit * 4, Kirigami.Units.gridUnit * 20)
        height: Kirigami.Units.gridUnit * 20
        standardButtons: Controls.Dialog.Close
        title: qsTr("Checkable List Items")

        contentItem: Controls.ScrollView {
            ListView {
                model: 20
                delegate: Controls.CheckDelegate {
                    width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                    text: qsTr("Delegate %1").arg(modelData + 1)
                }
            }
            Component.onCompleted: background.visible = true;
        }
    }

    Controls.Dialog {
        id: radioListDialog
        modal: true
        focus: true
        x: (page.width - width) / 2
        y: page.height / 2 - height
        width: Math.min(page.width - Kirigami.Units.gridUnit * 4, Kirigami.Units.gridUnit * 20)
        height: Kirigami.Units.gridUnit * 20
        standardButtons: Controls.Dialog.Close
        title: qsTr("Radio List Items")

        contentItem: Controls.ScrollView {
            ListView {
                model: 20
                delegate: Controls.RadioDelegate {
                    width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                    text: qsTr("Delegate %1").arg(modelData + 1)
                }
            }
            Component.onCompleted: background.visible = true;
        }
    }

    Controls.Dialog {
        id: switchListDialog
        modal: true
        focus: true
        x: (page.width - width) / 2
        y: page.height / 2 - height
        width: Math.min(page.width - Kirigami.Units.gridUnit * 4, Kirigami.Units.gridUnit * 20)
        height: Kirigami.Units.gridUnit * 20
        standardButtons: Controls.Dialog.Close
        title: qsTr("Radio List Items")

        contentItem: Controls.ScrollView {
            ListView {
                model: 20
                delegate: Controls.SwitchDelegate {
                    width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                    text: qsTr("Delegate %1").arg(modelData + 1)
                }
            }
            Component.onCompleted: background.visible = true;
        }
    }

    Kirigami.FormLayout {
        Item {
            Kirigami.FormData.label: qsTr("Checkboxes")
            Kirigami.FormData.isSection: true
        }
        Controls.CheckBox {
            text: qsTr("Item selected")
            checked: true
        }
        Controls.CheckBox {
            text: qsTr("Item not selected")
            checked: false
        }
        Controls.Button {
            text: qsTr("Checkable List View")
            onClicked: checkListDialog.open()
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: qsTr("Radio buttons")
        }
        ColumnLayout {
            Controls.RadioButton {
                text: qsTr("Item selected")
                checked: true
            }
            Controls.RadioButton {
                text: qsTr("Item not selected")
                checked: false
            }
        }
        Controls.Button {
            text: qsTr("Radio List View")
            onClicked: radioListDialog.open()
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: qsTr("Switches")
        }
        Controls.Switch {
            text: qsTr("Item selected")
            checked: true
        }
        Controls.Switch {
            text: qsTr("Item not selected")
            checked: false
        }
        Controls.Button {
            text: qsTr("Switch List View")
            onClicked: switchListDialog.open()
        }
    }
}
