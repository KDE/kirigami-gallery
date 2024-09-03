/*
 *   Copyright 2016 Aleix Pol Gonzalez <aleixpol@kde.org>
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
    id: root

    title: qsTr("Colors")

    actions: KGC.InfoSheetAction {
        page: page
        component: "ColorsGallery"
    }

    readonly property list<string> keys: [
        "textColor",
        "disabledTextColor",
        "highlightedTextColor",
        "activeTextColor",
        "linkColor",
        "visitedLinkColor",
        "negativeTextColor",
        "neutralTextColor",
        "positiveTextColor",
        "backgroundColor",
        "highlightColor",
        "activeBackgroundColor",
        "linkBackgroundColor",
        "visitedLinkBackgroundColor",
        "negativeBackgroundColor",
        "neutralBackgroundColor",
        "positiveBackgroundColor",
        "alternateBackgroundColor",
        "focusColor",
        "hoverColor",
    ];

    function setName(id: int): string {
        switch (id) {
        case Kirigami.Theme.View:
            return "Theme.View";
        case Kirigami.Theme.Window:
            return "Theme.Window";
        case Kirigami.Theme.Button:
            return "Theme.Button";
        case Kirigami.Theme.Selection:
            return "Theme.Selection";
        case Kirigami.Theme.Tooltip:
            return "Theme.Tooltip";
        case Kirigami.Theme.Complementary:
            return "Theme.Complementary";
        case Kirigami.Theme.Header:
            return "Theme.Header";
        }
    }

    function preProcessWrap(string: string): string {
        // split camelCase string with ZWSP (Zero-width space) characters, so it can word-wrap on sub-word boundaries.
        // This is very rudimentary replacement; a better algorithm is in kcoreaddons KStringHandler::preProcessWrap.
        return string.replace(/[A-Z]/g, "\u200b$&");
    }

    Column {
        Kirigami.Heading {
            text: "Colors by Theme.colorSet"
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            bottomPadding: Kirigami.Units.largeSpacing
        }

        Repeater {
            model: Kirigami.Theme.ColorSetCount
            delegate: Column {
                id: colorSetDelegate

                required property int index

                width: parent.width

                Kirigami.Heading {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter

                    topPadding: Kirigami.Units.gridUnit
                    bottomPadding: Kirigami.Units.largeSpacing

                    level: 2
                    text: setName(index)
                }

                Flow {
                    id: view

                    Kirigami.Theme.colorSet: colorSetDelegate.index
                    Kirigami.Theme.inherit: false

                    anchors.horizontalCenter: parent.horizontalCenter
                    width: Math.floor(parent.width / (Kirigami.Units.gridUnit * 9)) * (Kirigami.Units.gridUnit * 9)

                    Repeater {
                        model: root.keys

                        delegate: ColumnLayout {
                            id: colorDelegate

                            required property string modelData

                            width: Kirigami.Units.gridUnit * 9

                            Rectangle {
                                Layout.alignment: Qt.AlignHCenter
                                width: Kirigami.Units.gridUnit * 7
                                height: Kirigami.Units.gridUnit * 3
                                color: Kirigami.Theme[colorDelegate.modelData]
                                border {
                                    width: 1
                                    color: "black"
                                }
                            }

                            Kirigami.SelectableLabel {
                                Kirigami.Theme.colorSet: Kirigami.Theme.Window
                                Kirigami.Theme.inherit: false
                                Layout.fillWidth: true
                                Layout.leftMargin: Kirigami.Units.gridUnit
                                Layout.rightMargin: Kirigami.Units.gridUnit
                                Layout.bottomMargin: Kirigami.Units.gridUnit
                                horizontalAlignment: TextEdit.AlignHCenter
                                text: root.preProcessWrap(colorDelegate.modelData)
                                wrapMode: Text.Wrap
                            }
                        }
                    }
                }
            }
        }
    }
}
