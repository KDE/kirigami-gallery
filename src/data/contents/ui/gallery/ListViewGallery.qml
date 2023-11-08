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

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    title: "Long List view"

    actions: Kirigami.Action {
        icon.name: sheet.visible ? "dialog-cancel" : "document-edit"
        text: "Main Action Text"
        checkable: true
        onCheckedChanged: sheet.visible = checked;
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.visible) {
            event.accepted = true;
            sheet.close();
        }
    }

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
    Kirigami.OverlaySheet {
        id: sheet
        onVisibleChanged: page.actions.checked = visible;
        parent: applicationWindow().overlay
        header: Kirigami.Heading {
            text: "Title"
        }
        footer: RowLayout {
            QQC2.Label {
                text: "Footer:"
            }
            QQC2.TextField {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
            }
        }
        ListView {
            model: 100
            reuseItems: true
            implicitWidth: Kirigami.Units.gridUnit * 30
            delegate: QQC2.ItemDelegate {
                text: "Item in sheet" + modelData
                width: ListView.view.width
            }
        }
    }

    Component {
        id: delegateComponent
        Kirigami.SwipeListItem {
            id: listItem
            width: ListView.view ? ListView.view.width : implicitWidth
            contentItem: RowLayout {
                Kirigami.ListItemDragHandle {
                    listItem: listItem
                    listView: mainList
                    onMoveRequested: (oldIndex, newIndex) => listModel.move(oldIndex, newIndex, 1)
                }

                QQC2.Label {
                    Layout.fillWidth: true
                    height: Math.max(implicitHeight, Kirigami.Units.iconSizes.smallMedium)
                    text: model.title
                    color: listItem.checked || (listItem.pressed && !listItem.checked && !listItem.sectionDelegate) ? listItem.activeTextColor : listItem.textColor
                }
            }
            actions: [
                Kirigami.Action {
                    icon.name: "document-decrypt"
                    text: "Action 1"
                    onTriggered: showPassiveNotification(model.text + " Action 1 clicked")
                },
                Kirigami.Action {
                    icon.name: "mail-reply-sender"
                    text: "Action 2"
                    onTriggered: showPassiveNotification(model.text + " Action 2 clicked")
                }]
        }
    }
    ListView {
        id: mainList
        reuseItems: true
        Timer {
            id: refreshRequestTimer
            interval: 3000
            onTriggered: page.refreshing = false
        }
        model: ListModel {
            id: listModel

            Component.onCompleted: {
                for (var i = 0; i < 200; ++i) {
                    listModel.append({"title": "Item " + i,
                        "actions": [{text: "Action 1", icon: "document-decrypt"},
                                    {text: "Action 2", icon: "mail-reply-sender"}],
                        "sec": Math.floor(i/10)
                    })
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
            property: "sec"
            delegate: Kirigami.ListSectionHeader {
                text: "Section " + (parseInt(section) + 1)
            }
        }
    }
}
