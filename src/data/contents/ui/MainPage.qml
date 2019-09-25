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

import QtQuick 2.1
import QtQuick.Controls 2.0 as QQC2
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.10 as Kirigami

Kirigami.ScrollablePage {
    id: pageRoot

    implicitWidth: Kirigami.Units.gridUnit * 20
    background: Rectangle {
        color: Kirigami.Theme.backgroundColor
    }

    title: qsTr("Kirigami Gallery")

    //flickable: mainListView
    actions {
        contextualActions: [
            Kirigami.Action {
                text:"Action 1"
                iconName: "document-decrypt"
                onTriggered: showPassiveNotification("Action 1 clicked")
            },
            Kirigami.Action {
                id: shareAction
                visible: checkableAction.checked
                text:"Action 2"
                iconName: "document-share"
                onTriggered: showPassiveNotification("Action 2 clicked")
            },
            Kirigami.Action {
                id: checkableAction
                text:"Checkable"
                checkable: true
                iconName: "dashboard-show"
                onCheckedChanged: showPassiveNotification("Checked: " + checked)
            }
        ]
    }

    Kirigami.PagePool {
        id: mainPagePool
    }
    ListView {
        id: mainListView
        currentIndex: -1
        //currentIndex has focus, openPageIndex is the one actually open now
        activeFocusOnTab: true
        focus: true

        model: pageActions
        property list<Kirigami.Action> pageActions: [
            Kirigami.PagePoolAction {
                text: qsTr("Buttons")
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/ButtonGallery.qml"
             },
             Kirigami.PagePoolAction {
                text: qsTr("Selection Controls")
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/SelectionControlsGallery.qml"
             },
             Kirigami.PagePoolAction {
                text: qsTr("Overlay Sheets")
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/OverlaySheetGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: qsTr("Drawers")
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/DrawerGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Progress Bar"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/ProgressBarGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Slider"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/SliderGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Tab Bar"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/TabBarGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Text Field"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/TextFieldGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Form Layout"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/FormLayoutGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Cards Layout"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/CardsLayoutGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "List view of cards"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/CardsListViewGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Grid view of cards"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/CardsGridViewGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Inline Messages"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/InlineMessagesGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Multiple Columns"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/MultipleColumnsGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Misc widgets"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/MisGallery.qmlc"
            },
            Kirigami.PagePoolAction {
                text: "List View"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/ListViewGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "List Headers"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/ListViewHeaderItemsGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Non Scrollable Page"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/NonScrollablGallery.qmle"
            },
            Kirigami.PagePoolAction {
                text: "Colors"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/ColorsGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Color Sets"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/ColorSetGallery.qml"
            },
            Kirigami.PagePoolAction {
                text: "Metrics"
                pagePool: mainPagePool
                basePage: pageRoot
                page: "gallery/MetricsGallery.qml"
            }
        ]
        delegate: Kirigami.BasicListItem {
            id: listItem

            reserveSpaceForIcon: false
            label: modelData.text

            Accessible.role: Accessible.MenuItem
            onClicked: modelData.trigger()

            checked: modelData.checked
            highlighted: focus && ListView.isCurrentItem
        }
    }
}

