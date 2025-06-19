/*
 *   Copyright 2015 Marco Martin <mart@kde.org>
 *   Copyright 2022,2024 ivan tkachenko <me@ratijas.tk>
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
    title: qsTr("Selection Controls")

    actions: KGC.InfoSheetAction {
        page: page
        component: "SelectionControlsGallery"
    }

    Kirigami.Dialog {
        id: checkListDialog
        preferredWidth: Kirigami.Units.gridUnit * 20
        title: qsTr("Checkable List Items")

        ListView {
            clip: true
            model: 20
            delegate: QQC2.CheckDelegate {
                required property int index

                width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                text: qsTr("Delegate %1").arg(index + 1)
            }
        }
    }

    Kirigami.Dialog {
        id: radioListDialog
        preferredWidth: Kirigami.Units.gridUnit * 20
        title: qsTr("Radio List Items")

        ListView {
            clip: true
            model: 20
            delegate: QQC2.RadioDelegate {
                required property int index

                width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                text: qsTr("Delegate %1").arg(index + 1)
            }
        }
    }

    Kirigami.Dialog {
        id: switchListDialog
        preferredWidth: Kirigami.Units.gridUnit * 20
        title: qsTr("Radio List Items")

        ListView {
            clip: true
            model: 20
            delegate: QQC2.SwitchDelegate {
                required property int index

                width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
                text: qsTr("Delegate %1").arg(index + 1)
            }
        }
    }

    Kirigami.FormLayout {
        Item {
            Kirigami.FormData.label: qsTr("Checkboxes")
            Kirigami.FormData.isSection: true
        }
        QQC2.CheckBox {
            text: qsTr("Item selected")
            checked: true
        }
        QQC2.CheckBox {
            text: qsTr("Item not selected")
            checked: false
        }
        QQC2.Button {
            text: qsTr("Checkable List View")
            onClicked: checkListDialog.open()
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: qsTr("Radio buttons")
        }
        ColumnLayout {
            QQC2.RadioButton {
                text: qsTr("Item selected")
                checked: true
            }
            QQC2.RadioButton {
                text: qsTr("Item not selected")
                checked: false
            }
        }
        QQC2.Button {
            text: qsTr("Radio List View")
            onClicked: radioListDialog.open()
        }

        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: qsTr("Switches")
        }
        QQC2.Switch {
            text: qsTr("Item selected")
            checked: true
        }
        QQC2.Switch {
            text: qsTr("Item not selected")
            checked: false
        }
        QQC2.Button {
            text: qsTr("Switch List View")
            onClicked: switchListDialog.open()
        }
    }
}
