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

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    //implicitWidth: Kirigami.Units.gridUnit * (Math.floor(Math.random() * 35) + 10)

    title: "Buttons"

    actions: [
        Kirigami.Action {
            icon.name: sheet.opened ? "dialog-cancel" : "document-edit"
            text: "Main Action Text"
            checkable: true
            onCheckedChanged: sheet.opened = checked;
            shortcut: "Alt+S"
        },
        Kirigami.Action {
            icon.name: "go-previous"
            text: "Left Action Text"
            onTriggered: {
                showPassiveNotification("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis.")
            }
        },
        Kirigami.Action {
            icon.name: "go-next"
            text: "Right Action Text"
            onTriggered: {
                showPassiveNotification("Right action triggered")
            }
        },
        Kirigami.Action {
            text:"Action Parent Expandible"
            icon.name: "bookmarks"
            expandible: true
            Kirigami.Action {
                text: "Sub action 1"
            }
            Kirigami.Action {
                text: "Sub action 1"
            }
        },
        Kirigami.Action {
            text:"Action Parent"
            icon.name: "bookmarks"
            Kirigami.Action {
                text: "Sub action 1"
            }
            Kirigami.Action {
                text: "Sub action 1"
            }
        },
        Kirigami.Action {
            text:"Disabled Action"
            icon.name: "folder"
            enabled: false
        },
        Kirigami.Action {
            text: "Action for Sheet"
            visible: sheet.opened
        }
    ]


    //Close the drawer with the back button
    onBackRequested: {
        if (bottomDrawer.drawerOpen) {
            event.accepted = true;
            bottomDrawer.close();
        }
        if (sheet.opened) {
            event.accepted = true;
            sheet.close();
        }
    }

    Kirigami.OverlayDrawer {
        id: bottomDrawer
        edge: Qt.BottomEdge
        contentItem: Item {
            implicitHeight: childrenRect.height + Kirigami.Units.gridUnit
            ColumnLayout {
                anchors.centerIn: parent
                QQC2.Button {
                    text: "Button1"
                    onClicked: showPassiveNotification("Button 1 clicked")
                }
                QQC2.Button {
                    text: "Button2"
                    onClicked: showPassiveNotification("Button 2 clicked")
                }
                Item {
                    Layout.minimumHeight: Kirigami.Units.gridUnit * 4
                }
            }
        }
    }

    Kirigami.OverlaySheet {
        id: sheet
        onVisibleChanged: page.actions[0].checked = sheetOpen
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
        ColumnLayout {
            QQC2.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis."
            }

            QQC2.TextField {
                Layout.alignment: Qt.AlignHCenter
            }

            QQC2.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: `
    Morbi dictum, sapien at maximus pulvinar, sapien metus condimentum magna, quis lobortis nisi dui mollis turpis. Aliquam sit amet scelerisque dui. In sit amet tellus placerat, condimentum enim sed, hendrerit quam. Integer dapibus lobortis finibus. Suspendisse faucibus eros vitae ante posuere blandit. Nullam volutpat quam id diam hendrerit aliquam. Donec non sem at diam posuere convallis. Vivamus ut congue quam. Ut dictum fermentum sapien, eu ultricies est ornare ut.

    Nullam fringilla a libero vehicula faucibus. Donec euismod sodales nulla, in vehicula lectus posuere a. Donec nisi nulla, pulvinar eu porttitor vitae, varius eget ante. Nam rutrum eleifend elit, quis facilisis leo sodales vitae. Aenean accumsan a nulla at sagittis. Integer placerat tristique magna, vitae iaculis ante cursus sit amet. Sed facilisis mollis turpis nec tristique. Etiam quis feugiat odio. Vivamus sagittis at purus nec aliquam.

    Morbi neque dolor, elementum ac fermentum ac, auctor ut erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus non nibh sit amet quam luctus congue. Donec in eros varius, porta metus sed, sagittis lacus. Mauris dapibus lorem nisi, non eleifend massa tristique egestas. Curabitur nec blandit urna. Mauris rhoncus libero felis, commodo viverra ante consectetur vel. Donec dictum tincidunt orci, quis tristique urna. Quisque egestas, dui ac mollis dictum, purus velit elementum est, at pellentesque erat est fermentum purus. Nulla a quam tellus. Vestibulum a congue ligula. Quisque feugiat nulla et tortor sodales viverra. Maecenas dolor leo, elementum sed urna vel, posuere hendrerit metus. Mauris pellentesque, mi non luctus aliquam, leo nulla varius arcu, vel pulvinar enim enim nec nisl.

    Etiam sapien leo, venenatis eget justo at, pellentesque mollis tellus. Fusce consequat ullamcorper vulputate. Duis tellus nisi, dictum ut augue non, elementum congue ligula. Fusce in vehicula arcu. Nulla facilisi. Quisque a convallis sapien. Aenean pellentesque convallis egestas. Phasellus rhoncus, nulla in tempor maximus, arcu ex venenatis diam, sit amet egestas mi dolor non ante.`
            }
            QQC2.Button {
                text: "Close"
                Layout.alignment: Qt.AlignHCenter
                onClicked: sheet.close()
            }
        }
    }
    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        QQC2.ComboBox {
            Layout.alignment: Qt.AlignHCenter
            textRole: "text"
            model: [{"text": "Default", "value": -1},
                    {"text": "Toolbar", "value":Kirigami.ApplicationHeaderStyle.ToolBar},
                    {"text": "Titles", "value":Kirigami.ApplicationHeaderStyle.Titles},
                    {"text": "None", "value":Kirigami.ApplicationHeaderStyle.None}]
            onActivated: {
                if (index === 0) {
                    page.globalToolBarStyle = applicationWindow().pageStack.globalToolBar.actualStyle
                } else {
                    page.globalToolBarStyle = model[index].value;
                }
            }
        }
        QQC2.Button {
            text: "Open &Bottom drawer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: bottomDrawer.open()
        }
        QQC2.Button {
            text: "Open Sheet"
            Layout.alignment: Qt.AlignHCenter
            onClicked: sheet.open()
        }
        QQC2.Button {
            text: "Toggle Action Button"
            Layout.alignment: Qt.AlignHCenter
            onClicked: mainAction.visible = !mainAction.visible;
        }
        QQC2.Button {
            text: "Show Passive Notification"
            Layout.alignment: Qt.AlignHCenter
            onClicked: showPassiveNotification("This is a passive message", 3000);
        }
        QQC2.Button {
            text: "Passive Notification Action"
            Layout.alignment: Qt.AlignHCenter
            onClicked: showPassiveNotification("This is a passive message", "long", "Action", function() {showPassiveNotification("Passive notification action clicked")});
        }
        QQC2.ToolButton {
            text: "Toggle controls"
            checkable: true
            checked: true
            Layout.alignment: Qt.AlignHCenter
            onCheckedChanged: applicationWindow().controlsVisible = checked
        }
        QQC2.Button {
            text: "Disabled Button"
            enabled: false
            Layout.alignment: Qt.AlignHCenter
            onClicked: showPassiveNotification("clicked")
        }
        QQC2.ToolButton {
            text: "Tool Button"
            icon.name: "go-next"
            Layout.alignment: Qt.AlignHCenter
            onClicked: showPassiveNotification(text + " clicked")
        }
        QQC2.ToolButton {
            text: "Tool Button non flat"
            flat: false
            Layout.alignment: Qt.AlignHCenter
            onClicked: showPassiveNotification(text + " clicked")
        }
    }
}
