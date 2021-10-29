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

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.15 as Kirigami

Kirigami.ScrollablePage {
    id: page

    title: qsTr("Selection Controls")

    actions.main:  Kirigami.Action {
        text: qsTr("Info")
        iconName: "documentinfo"
        checkable: true
        onCheckedChanged: sheet.sheetOpen = checked;
        shortcut: "Alt+I"
    }

    InfoSheet {
        id: sheet
        page: page
        component: "SelectionControlsGallery"
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
    }
}
