/*
 *  SPDX-FileCopyrightText: 2024 ivan tkachenko <me@ratijas.tk>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T
import org.kde.kirigami as Kirigami

Kirigami.Action {
    id: root

    required property Kirigami.Page page

    checkable: true
    checked: sheetVisible()

    onToggled: {
        if (!__sheet && checked) {
            // assign an already visible sheet to avoid double-changing the checked state
            const sheet = sheetComponent.createObject(this);
            sheet.visible = true;
            __sheet = sheet;
        } else if (__sheet) {
            __sheet.visible = checked;
        }
    }

    function sheetVisible(): bool {
        return __sheet?.visible ?? false;
    }

    required property Component sheetComponent
    property T.Popup __sheet

    // Note: This is very wrong. The order of signal handlers in undefined, it
    // may be invoked before or after the page's base handler.
    readonly property Connections __connections: Connections {
        target: root.page
        function onBackRequested(event: var): void {
            if (root.sheetVisible()) {
                root.__sheet.close();
                event.accepted = true;
            }
        }
    }
}
