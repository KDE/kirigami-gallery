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

import QtQuick 2.0
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.4 as Kirigami

import "components"

Kirigami.ScrollablePage {
    id: page
    actions.main: Kirigami.Action {
        iconName: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.sheetOpen = checked;
        shortcut: "Alt+I"
    }

    Layout.fillWidth: true
    title: qsTr("Selection Controls")

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.sheetOpen) {
            event.accepted = true;
            sheet.close();
        }
    }

    InfoSheet {
        id: sheet
        page: page
        title: qsTr("Selection Controls")
        higUrl: "https://hig.kde.org/components/index.html#selection"
        sourceUrl: "https://cgit.kde.org/kirigami.git/tree/examples/gallerydata/contents/ui/gallery/SelectionControlsGallery.qml"
        text: qsTr("<p>Selection controls allow users to complete tasks that involve a choice or a selection.</p> <p>Depending from The kind of choice that has to be made, the best control to use may be a Checkbox, a RadioButton, or a Switch.</p> <ul><li>Use checkboxes for non-exclusive options that have clear alternatives. Mutually exclusive options should use a set of radio buttons or a combo box.</li> <li>Use radio buttons for a few mutually exclusive options. If there are more than five options (or if there is not enough space to arrange four or five options), use a combo box or list instead.</li> <li>Use switches on Mobile, when immediately activating or deactivating something (ok/Apply buttons not needed).</li></ul>")
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
    }
}
