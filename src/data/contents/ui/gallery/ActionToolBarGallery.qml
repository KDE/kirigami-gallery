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
import org.kde.kirigami 2.20 as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true

    title: "Action Tool Bar"

    actions: [
        Kirigami.Action {
            icon.name: "documentinfo"
            text: qsTr("Info")
            checkable: true
            onCheckedChanged: sheet.visible = checked;
            shortcut: "Alt+I"
        }
    ]

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.sheetOpen) {
            event.accepted = true;
            sheet.close();
        }
    }

    KGC.InfoSheet {
        id: sheet

        page: page
        component: "ActionToolBar"
    }

    property int alignment: Qt.AlignLeft

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        QQC2.Label { text: "Basic Actions and Alignment"; elide: Text.ElideRight; Layout.fillWidth: true }

        QQC2.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            Kirigami.ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Kirigami.Action { text: "Align Left"; icon.name: "align-horizontal-left"; onTriggered: page.alignment = Qt.AlignLeft },
                    Kirigami.Action { text: "Align Center"; icon.name: "align-horizontal-center"; onTriggered: page.alignment = Qt.AlignHCenter },
                    Kirigami.Action { text: "Align Right"; icon.name: "align-horizontal-right"; onTriggered: page.alignment = Qt.AlignRight }
                ]
            }
        }

        QQC2.Label { text: "Display Hints"; elide: Text.ElideRight; Layout.fillWidth: true }

        QQC2.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            Kirigami.ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Kirigami.Action { text: "IconOnly"; icon.name: "view-list-icons"; displayHint: Kirigami.DisplayHint.IconOnly },
                    Kirigami.Action { text: "KeepVisible"; icon.name: "view-visible"; displayHint: Kirigami.DisplayHint.KeepVisible },
                    Kirigami.Action {
                        text: "HideChildIndicator";
                        icon.name: "overflow-menu"
                        displayHint: Kirigami.DisplayHint.HideChildIndicator

                        Kirigami.Action {
                            text: "Child Action"
                        }
                    },
                    Kirigami.Action { text: "AlwaysHide"; icon.name: "password-show-off"; displayHint: Kirigami.DisplayHint.AlwaysHide }
                ]
            }
        }

        QQC2.Label { text: "Custom Display Component"; elide: Text.ElideRight; Layout.fillWidth: true }

        QQC2.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            Kirigami.ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Kirigami.Action { id: customAction; text: "Custom Component"; icon.name: "search"; displayComponent: Kirigami.SearchField { } },
                    Kirigami.Action {
                        text: "Add IconOnly Hint";
                        icon.name: "list-add";
                        onTriggered: customAction.displayHint |= Kirigami.DisplayHint.IconOnly
                    },
                    Kirigami.Action {
                        text: "Remove IconOnly Hint";
                        icon.name: "list-remove"
                        onTriggered: customAction.displayHint ^= Kirigami.DisplayHint.IconOnly
                    }
                ]
            }
        }

        QQC2.Label { text: "All Custom Components and Layouts"; elide: Text.ElideRight; Layout.fillWidth: true }

        QQC2.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            Kirigami.ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Kirigami.Action { id: kirigamiAction; text: "Action 1"; displayComponent: QQC2.Button { text: kirigamiAction.text } },
                    Kirigami.Action {
                        text: "Action 2";
                        displayComponent: QQC2.TextField { placeholderText: kirigamiAction.text; Layout.fillWidth: true; Layout.maximumWidth: 350 }
                    },
                    Kirigami.Action { text: "Action 3"; displayComponent: QQC2.SpinBox { } },
                    Kirigami.Action { text: "Action 4"; displayComponent: QQC2.RangeSlider { Layout.fillWidth: true } }
                ]
            }
        }
    }
}

