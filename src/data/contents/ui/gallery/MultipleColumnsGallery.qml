// SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
// SPDX-FileCopyrightText: 2022 Carl Schwan <carl@carlschwan.eu>
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2
import QtQuick.Controls 2 as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: root

    property int depth: 1

    title: "Page " + depth

    actions: [
        Kirigami.Action {
            icon.name: "document-edit"
            text: "Main Action Text"

            Kirigami.Action {
                text: "Sub Action 1"
                onTriggered: showPassiveNotification("Sub Action 1 clicked");
            }

            Kirigami.Action {
                text: "Sub Action 2"
                onTriggered: showPassiveNotification("Sub Action 2 clicked");
            }
        },
        Kirigami.Action {
            icon.name: "go-previous"
            text: "Left Action Text"
            onTriggered: showPassiveNotification("Left action triggered")

            Kirigami.Action {
                text: "Sub Action 1"
                onTriggered: showPassiveNotification("Sub Action 1 clicked");
            }

            Kirigami.Action {
                text: "Sub Action 2"
                onTriggered: {
                    showPassiveNotification("Sub Action 2 clicked");
                }
            }
        },
        Kirigami.Action {
            icon.name: "go-next"
            text: "Right Action Text"
            onTriggered: showPassiveNotification("Right action triggered")

            Kirigami.Action {
                text: "Sub Action 1"
                onTriggered: showPassiveNotification("Sub Action 1 clicked");
            }

            Kirigami.Action {
                text: "Sub Action 2"
                onTriggered: showPassiveNotification("Sub Action 2 clicked");
            }
        },
        Kirigami.Action {
            text:"Action 1"
            icon.name: "bookmarks"
            onTriggered: showPassiveNotification("Action 1 clicked")
        },
        Kirigami.Action {
            text:"Action 2"
            icon.name: "folder"
            enabled: false
            onTriggered: showPassiveNotification("Action 2 clicked")
        }
    ]

    ColumnLayout {
        width: root.width
        spacing: Units.smallSpacing

        QQC2.Label {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: "This page is used to test multiple columns: you can push and pop an arbitrary number of pages, each new page will have a random implicit width between 8 and 35 grid units.\nIf you enlarge the window enough, you can test how the application behaves with multiple columns."
        }
        Item {
            Layout.minimumWidth: Units.gridUnit *2
            Layout.minimumHeight: Layout.minimumWidth
        }
        QQC2.Switch {
            text: qsTr("Pin page")
            onCheckedChanged: root.ColumnView.pinned = checked
        }
        QQC2.Button {
            text: "Push Another Page"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                pageStack.push(Qt.resolvedUrl("MultipleColumnsGallery.qml"), {
                    depth: root.depth + 1,
                });
            }
        }
        QQC2.Button {
            text: "Push Two Pages"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                const url = Qt.resolvedUrl("MultipleColumnsGallery.qml");
                pageStack.push([url, url], [
                    { depth: root.depth + 1 },
                    { depth: root.depth + 2 }
                ]);
            }
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
