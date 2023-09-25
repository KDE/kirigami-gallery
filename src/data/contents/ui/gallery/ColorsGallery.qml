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

import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import QtQuick.Controls as QQC2

Kirigami.ScrollablePage {
    id: page
    title: "Colors"

   // leftPadding: 20//Units.gridUnit
    function endsWith(subject, predicate) {
        var idx = subject.indexOf(predicate);
        return idx + predicate.length == subject.length;
    }

    function getkeys() {
         var keys = ["textColor",
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
            "hoverColor"];

            return keys;
    }

    function setName(id) {
        switch(id) {
        case 0:
            return "Theme.View";
        case 1:
            return "Theme.Window";
        case 2:
            return "Theme.Button";
        case 3:
            return "Theme.Selection";
        case 4:
            return "Theme.Tooltip";
        case 5:
            return "Theme.Complementary";
        case 6:
            return "Theme.Header";
        }
    }

    Column {
        Kirigami.Heading {
            text: "Colors by Theme.colorSet"
        }
        Repeater {
            model: Kirigami.Theme.Header + 1
            delegate: Column {
                width: parent.width
                Kirigami.Heading {
                    level: 2
                    text: setName(modelData)
                }
                Flow {
                    id: view
                    Kirigami.Theme.colorSet: modelData
                    Kirigami.Theme.inherit: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: Math.floor(parent.width / (Kirigami.Units.gridUnit * 9)) * (Kirigami.Units.gridUnit * 9)
                    Repeater {
                        model: page.getkeys()

                        delegate: ColumnLayout {
                            width: Kirigami.Units.gridUnit * 9
                            Rectangle {
                                Layout.alignment: Qt.AlignHCenter
                                width: Kirigami.Units.gridUnit * 7
                                height: Kirigami.Units.gridUnit * 3
                                color: Kirigami.Theme[modelData]
                                border {
                                    width: 1
                                    color: "black"
                                }
                            }
                            QQC2.Label {
                                Kirigami.Theme.colorSet: Kirigami.Theme.Window
                                Kirigami.Theme.inherit: false
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                                text: modelData
                            }
                            Item {
                                width: 1
                                height: Kirigami.Units.smallSpacing
                            }
                        }
                    }
                }
            }
        }
    }
}
