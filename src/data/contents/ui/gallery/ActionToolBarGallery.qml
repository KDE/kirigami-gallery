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

import QtQuick 2.11
import QtQuick.Controls 2.11 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.11

import "components"

ScrollablePage {
    id: page
    Layout.fillWidth: true

    title: "Action Tool Bar"

    actions.main: Action {
        iconName: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.sheetOpen = checked;
        shortcut: "Alt+I"
    }

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
        component: "ActionToolBar"
    }

    property int alignment: Qt.AlignLeft

    ColumnLayout {
        width: page.width
        spacing: Units.smallSpacing

        Controls.Label { text: "Basic Actions and Alignment"; elide: Text.ElideRight; Layout.fillWidth: true }

        Controls.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Action { text: "Align Left"; icon.name: "align-horizontal-left"; onTriggered: page.alignment = Qt.AlignLeft },
                    Action { text: "Align Center"; icon.name: "align-horizontal-center"; onTriggered: page.alignment = Qt.AlignHCenter },
                    Action { text: "Align Right"; icon.name: "align-horizontal-right"; onTriggered: page.alignment = Qt.AlignRight }
                ]
            }
        }

        Controls.Label { text: "Display Hints"; elide: Text.ElideRight; Layout.fillWidth: true }

        Controls.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Action { text: "IconOnly"; icon.name: "view-list-icons"; displayHint: Action.DisplayHint.IconOnly },
                    Action { text: "KeepVisible"; icon.name: "view-visible"; displayHint: Action.DisplayHint.KeepVisible },
                    Action {
                        text: "HideChildIndicator";
                        icon.name: "overflow-menu"
                        displayHint: Action.DisplayHint.HideChildIndicator

                        Action {
                            text: "Child Action"
                        }
                    },
                    Action { text: "AlwaysHide"; icon.name: "password-show-off"; displayHint: Action.DisplayHint.AlwaysHide }
                ]
            }
        }

        Controls.Label { text: "Custom Display Component"; elide: Text.ElideRight; Layout.fillWidth: true }

        Controls.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Action { id: customAction; text: "Custom Component"; icon.name: "search"; displayComponent: SearchField { } },
                    Action {
                        text: "Add IconOnly Hint";
                        icon.name: "list-add";
                        onTriggered: customAction.displayHint |= Action.DisplayHint.IconOnly
                    },
                    Action {
                        text: "Remove IconOnly Hint";
                        icon.name: "list-remove"
                        onTriggered: customAction.displayHint ^= Action.DisplayHint.IconOnly
                    }
                ]
            }
        }

        Controls.Label { text: "All Custom Components and Layouts"; elide: Text.ElideRight; Layout.fillWidth: true }

        Controls.GroupBox {
            Layout.fillWidth: true
            Layout.minimumWidth: 0

            ActionToolBar {
                anchors.fill: parent
                alignment: page.alignment
                actions: [
                    Action { text: "Action 1"; displayComponent: Controls.Button { text: kirigamiAction.text } },
                    Action {
                        text: "Action 2";
                        displayComponent: Controls.TextField { placeholderText: kirigamiAction.text; Layout.fillWidth: true; Layout.maximumWidth: 350 }
                    },
                    Action { text: "Action 3"; displayComponent: Controls.SpinBox { } },
                    Action { text: "Action 4"; displayComponent: Controls.RangeSlider { Layout.fillWidth: true } }
                ]
            }
        }
    }
}

