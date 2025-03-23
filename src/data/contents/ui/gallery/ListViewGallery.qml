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

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import QtQuick.Templates as T
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    title: "Long List view"

    actions: [
        KGC.InfoSheetAction {
            page: page
            component: "ListViewGallery"
        },
        KGC.SheetAction {
            id: yahaha

            page: page

            icon.name: sheetVisible() ? "dialog-cancel-symbolic" : "document-edit-symbolic"
            text: qsTr("Main Action Text")

            sheetComponent: Kirigami.OverlaySheet {
                parent: page.QQC2.Overlay.overlay
                header: Kirigami.Heading {
                    text: "Title"
                }
                footer: RowLayout {
                    spacing: Kirigami.Units.smallSpacing

                    QQC2.Label {
                        text: qsTr("Footer:")
                    }
                    QQC2.TextField {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignCenter
                    }
                }
                ListView {
                    model: 100
                    implicitWidth: Kirigami.Units.gridUnit * 30
                    delegate: QQC2.ItemDelegate {
                        required property int index

                        width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin

                        text: qsTr("Item in sheet %n", "", index)
                    }
                }
            }
        }
    ]

    supportsRefreshing: true
    onRefreshingChanged: {
        if (refreshing) {
            refreshRequestTimer.running = true;
        } else {
            showPassiveNotification("Example refreshing completed")
        }
    }

    background: Rectangle {
        color: Kirigami.Theme.backgroundColor
    }

    Component {
        id: delegateComponent
        Kirigami.SwipeListItem {
            id: listItem

            required property int index
            required property string title

            width: ListView.view ? ListView.view.width : implicitWidth
            contentItem: RowLayout {
                Kirigami.ListItemDragHandle {
                    listItem: listItem
                    listView: mainList
                    onMoveRequested: (oldIndex, newIndex) => {
                        listModel.move(oldIndex, newIndex, 1);
                    }
                }

                QQC2.Label {
                    Layout.fillWidth: true
                    height: Math.max(implicitHeight, Kirigami.Units.iconSizes.smallMedium)
                    text: listItem.title
                    color: listItem.checked || (listItem.pressed && !listItem.checked && !listItem.sectionDelegate) ? listItem.activeTextColor : listItem.textColor
                }
            }
            actions: [
                Kirigami.Action {
                    icon.name: "document-decrypt"
                    text: qsTr("Action 1")
                    onTriggered: showPassiveNotification(qsTr("%1: %2 clicked").arg(listItem.title).arg(text))
                },
                Kirigami.Action {
                    icon.name: "mail-reply-sender"
                    text: qsTr("Action 2")
                    onTriggered: showPassiveNotification(qsTr("%1: %2 clicked").arg(listItem.title).arg(text))
                }
            ]
        }
    }
    ListView {
        id: mainList
        Timer {
            id: refreshRequestTimer
            interval: 3000
            onTriggered: {
                page.refreshing = false;
            }
        }
        model: ListModel {
            id: listModel

            Component.onCompleted: {
                for (let i = 0; i < 200; ++i) {
                    listModel.append({
                        title: qsTr("Item %1").arg(String(i)),
                        section: Math.floor(i / 10),
                    });
                }
            }
        }
        moveDisplaced: Transition {
            YAnimator {
                duration: Kirigami.Units.longDuration
                easing.type: Easing.InOutQuad
            }
        }
        delegate: delegateComponent
        section {
            property: "section"
            delegate: Kirigami.ListSectionHeader {
                required property string section

                text: qsTr("Section %1").arg(parseInt(section) + 1)
                width: ListView.view.width - ListView.view.leftMargin - ListView.view.rightMargin
            }
        }
    }
}
