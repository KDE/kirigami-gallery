/*
 *  SPDX-FileCopyrightText: 2024 ivan tkachenko <me@ratijas.tk>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2

SheetAction {
    id: root

    required property string component

    icon.name: "documentinfo"
    text: qsTr("Info")
    shortcut: "Alt+I"

    sheetComponent: InfoSheet {
        component: root.component
        parent: root.page.QQC2.Overlay.overlay
    }
}
