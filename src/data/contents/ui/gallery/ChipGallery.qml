/*
 *   Copyright 2022 Felipe Kinoshita <kinofhek@gmail.com>
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
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.19 as Kirigami

import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    Layout.fillWidth: true

    title: qsTr("Chips")

    actions: Kirigami.Action {
        text: qsTr("Info")
        icon.name: "documentinfo"
        checkable: true
        shortcut: "Alt+I"
        onCheckedChanged: sheet.visible = checked;
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.opened) {
            event.accepted = true;
            sheet.close();
        }
    }

    KGC.InfoSheet {
        id: sheet

        page: page
        component: "ChipGallery"
    }

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        Kirigami.FormLayout {
            Layout.fillWidth: true

            Item {
                Kirigami.FormData.label: qsTr("Closable Chips")
                Kirigami.FormData.isSection: true
            }

            Flow {
                Layout.fillWidth: true
                Layout.bottomMargin: Kirigami.Units.gridUnit

                spacing: Kirigami.Units.largeSpacing

                Repeater {
                    model: ListModel {
                        id: closableChips

                        ListElement { text: "One"}
                        ListElement { text: "Two"}
                        ListElement { text: "Three"}
                        ListElement { text: "Four"}
                        ListElement { text: "Five"}
                    }

                    Kirigami.Chip {
                        text: modelData

                        onRemoved: closableChips.remove(index)
                    }
                }
            }

            Item {
                Kirigami.FormData.label: qsTr("Informative Chips")
                Kirigami.FormData.isSection: true
            }

            Flow {
                Layout.fillWidth: true
                Layout.bottomMargin: Kirigami.Units.gridUnit

                spacing: Kirigami.Units.largeSpacing

                Repeater {
                    model: ListModel {
                        id: informativeChips

                        ListElement { text: "Info One"}
                        ListElement { text: "Another Info"}
                        ListElement { text: "Info Two"}
                        ListElement { text: "Short"}
                        ListElement { text: "Info Three"}
                        ListElement { text: "Very Long Information Four"}
                        ListElement { text: "Info Five"}
                        ListElement { text: "Medium Info Six"}
                    }

                    Kirigami.Chip {
                        checked: false
                        checkable: false

                        text: modelData

                        closable: false
                    }
                }
            }

            Item {
                Kirigami.FormData.label: qsTr("Checkable Chips")
                Kirigami.FormData.isSection: true
            }

            Flow {
                Layout.fillWidth: true
                spacing: Kirigami.Units.largeSpacing

                Repeater {
                    model: ListModel {
                        id: checkableChips

                        ListElement { text: "Option One"}
                        ListElement { text: "Option Two"}
                        ListElement { text: "Another Option"}
                        ListElement { text: "The Longest Option"}
                        ListElement { text: "Option Three"}
                    }

                    Kirigami.Chip {
                        text: modelData

                        closable: false
                    }
                }
            }
        }
    }
}

