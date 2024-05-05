/*
 *  SPDX-FileCopyrightText: 2024 ivan tkachenko <me@ratijas.tk>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami

Kirigami.Action {
    id: root

    required property Kirigami.Page page
    required property string component

    icon.name: "documentinfo"
    text: qsTr("Info")
    shortcut: "Alt+I"

    checkable: true
    checked: sheet.visible
    onToggled: source => {
        sheet.visible = checked;
    }

    readonly property InfoSheet sheet: InfoSheet {
        id: sheet

        component: root.component
        parent: root.page.QQC2.Overlay.overlay
    }

    // Note: This is very wrong. The order of signal handlers in undefined, it
    // may be invoked before or after the page's base handler.
    readonly property Connections __connections: Connections {
        target: root.page
        function onBackRequested(event: var): void {
            if (sheet.visible) {
                sheet.close();
                event.accepted = true;
            }
        }
    }
}
