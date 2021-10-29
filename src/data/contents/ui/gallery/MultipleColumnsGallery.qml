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
    id: root

    title: "Page " + depth

    property int depth: 1

    actions {
        left: Kirigami.Action {
            iconName: "go-previous"
            text: "Left Action Text"
            onTriggered: {
                showPassiveNotification("Left action triggered")
            }
            Kirigami.Action {
                text: "Sub Action 1"
                onTriggered: {
                    showPassiveNotification("Sub Action 1 clicked");
                }
            }
            Kirigami.Action {
                text: "Sub Action 2"
                onTriggered: {
                    showPassiveNotification("Sub Action 2 clicked");
                }
            }
        }
        right: Kirigami.Action {
            iconName: "go-next"
            text: "Right Action Text"
            onTriggered: {
                showPassiveNotification("Right action triggered")
            }
            Kirigami.Action {
                text: "Sub Action 1"
                onTriggered: {
                    showPassiveNotification("Sub Action 1 clicked");
                }
            }
            Kirigami.Action {
                text: "Sub Action 2"
                onTriggered: {
                    showPassiveNotification("Sub Action 2 clicked");
                }
            }
        }
        contextualActions: [
            Kirigami.Action {
                text:"Action 1"
                iconName: "bookmarks"
                onTriggered: showPassiveNotification("Action 1 clicked")
            },
            Kirigami.Action {
                text:"Action 2"
                iconName: "folder"
                enabled: false
                onTriggered: showPassiveNotification("Action 2 clicked")
            }
        ]
    }

    ColumnLayout {
        width: root.width
        spacing: Kirigami.Units.smallSpacing

        QQC2.Label {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: "This page is used to test multiple columns: you can push and pop an arbitrary number of pages, each new page will have a random implicit width between 8 and 35 grid units.\nIf you enlarge the window enough, you can test how the application behaves with multiple columns."
        }
        Item {
            Layout.minimumWidth: Kirigami.Units.gridUnit *2
            Layout.minimumHeight: Layout.minimumWidth
        }
        QQC2.Switch {
            text: qsTr("Pin page")
            onCheckedChanged: root.ColumnView.pinned = checked
        }
        QQC2.Button {
            text: "Push Another Page"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageStack.push(Qt.resolvedUrl("MultipleColumnsGallery.qml"), {"depth": root.depth + 1});
        }
        QQC2.Button {
            text: "Push Two Pages"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageStack.push([Qt.resolvedUrl("MultipleColumnsGallery.qml"), Qt.resolvedUrl("MultipleColumnsGallery.qml")], [{"depth": root.depth + 1}, {"depth": root.depth + 2}]);
        }
        QQC2.Button {
            text: "Pop A Page"
            Layout.alignment: Qt.AlignHCenter
            onClicked: pageStack.pop();
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            QQC2.TextField {
                id: edit
                text: root.title
            }
            QQC2.Button {
                text: "Rename Page"
                onClicked: root.title = edit.text;
            }
        }
    }
 
    
}
