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
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kitemmodels as KItemModels

Kirigami.ScrollablePage {
    id: pageRoot

    implicitWidth: Kirigami.Units.gridUnit * 20

    leftPadding: 0
    rightPadding: 0
    bottomPadding: 0
    topPadding: 0
    title: qsTr("Kirigami Gallery")

    //flickable: mainListView
    actions: [
        Kirigami.Action {
            text: "Go home"
            icon.name: "go-home"
            onTriggered: root.pageStack.pop(0)
            displayHint: Kirigami.DisplayHint.IconOnly
            visible: applicationWindow().pageStack.visibleItems.length !== 1
        },
        Kirigami.Action {
            text:"Action 1"
            icon.name: "document-decrypt"
            onTriggered: showPassiveNotification("Action 1 clicked")
        },
        Kirigami.Action {
            id: shareAction
            visible: checkableAction.checked
            text:"Action 2"
            icon.name: "document-share"
            onTriggered: showPassiveNotification("Action 2 clicked")
        },
        Kirigami.Action {
            id: checkableAction
            text:"Checkable"
            checkable: true
            icon.name: "dashboard-show"
            onCheckedChanged: checked => showPassiveNotification("Checked: " + checked)
        }
    ]

    Kirigami.PagePool {
        id: mainPagePool
    }
    ListModel {
        id: galleryModel
        ListElement {
            title: "Buttons"
            targetPage: "gallery/ButtonGallery.qml"
            img: "img/buttons.svg"
        }
        ListElement {
            title: "Chips"
            targetPage: "gallery/ChipGallery.qml"
            img: "img/chips.svg"
        }
        ListElement {
            title: "Selection Controls"
            targetPage: "gallery/SelectionControlsGallery.qml"
            img: "img/selection-controls.svg"
        }
        ListElement {
            title: "Drawers"
            targetPage: "gallery/DrawerGallery.qml"
            img: "img/drawers.svg"
        }
        ListElement {
            title: "Dialogs"
            targetPage: "gallery/DialogGallery.qml"
            img: "img/overlay-sheets.svg"
        }
        ListElement {
            title: "Overlay Sheets"
            targetPage: "gallery/OverlaySheetGallery.qml"
            img: "img/overlay-sheets.svg"
        }
        ListElement {
            title: "Progress Bar"
            targetPage: "gallery/ProgressBarGallery.qml"
            img: "img/progress-bar.svg"
        }
        ListElement {
            title: "Slider"
            targetPage: "gallery/SliderGallery.qml"
            img: "img/slider.svg"
        }
        ListElement {
            title: "Tab Bar"
            targetPage: "gallery/TabBarGallery.qml"
            img: "img/tabbar.svg"
        }
        ListElement {
            title: "Navigation Tab Bar"
            targetPage: "gallery/NavigationTabBarGallery.qml"
            img: "img/navigation-tabbar.svg"
        }
        ListElement {
            title: "Text Field"
            targetPage: "gallery/TextFieldGallery.qml"
            img: "img/textfield.svg"
        }
        ListElement {
            title: "Form Layout"
            targetPage: "gallery/FormLayoutGallery.qml"
            img: "img/formlayout.svg"
        }
        ListElement {
            title: "Cards Layout"
            targetPage: "gallery/CardsLayoutGallery.qml"
            img: "img/cardlayout.svg"
        }
        ListElement {
            title: "List View with Cards"
            targetPage: "gallery/CardsListViewGallery.qml"
            img: "img/cardlist.svg"
        }
        ListElement {
            title: "Inline Messages"
            targetPage: "gallery/InlineMessagesGallery.qml"
            img: "img/inlinemessage.svg"
        }
        ListElement {
            title: "Multiple Columns"
            targetPage: "gallery/MultipleColumnsGallery.qml"
            img: "img/columnview.svg"
        }
        ListElement {
            title: "Misc. Widgets"
            targetPage: "gallery/MiscGallery.qml"
            img: "img/miscwidgets.svg"
        }
        ListElement {
            title: "List View"
            targetPage: "gallery/ListViewGallery.qml"
            img: "img/listview.svg"
        }
        ListElement {
            title: "Non Scrollable Page"
            targetPage: "gallery/NonScrollableGallery.qml"
            img: "img/non-scroll-page.svg"
        }
        ListElement {
            title: "Action Tool Bar"
            targetPage: "gallery/ActionToolBarGallery.qml"
            img: "img/action-tool-bar.svg"
        }
        ListElement {
            title: "Colors"
            targetPage: "gallery/ColorsGallery.qml"
            img: "img/colors.svg"
        }
        ListElement {
            title: "Color Sets"
            targetPage: "gallery/ColorSetGallery.qml"
            img: "img/colorsets.svg"
        }
        ListElement {
            title: "Metrics"
            targetPage: "gallery/MetricsGallery.qml"
            img: "img/metrics.svg"
        }
    }
    header: QQC2.ToolBar {
        id: toolbar
        RowLayout {
            anchors.fill: parent
            Kirigami.SearchField {
                id: searchField

                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                Layout.maximumWidth: Kirigami.Units.gridUnit*30
            }
        }
    }
    KItemModels.KSortFilterProxyModel {
        id: filteredModel
        sourceModel: galleryModel
        filterRoleName: "title"
        filterRegularExpression: {
            if (searchField.text === "") return new RegExp()
            return new RegExp("%1".arg(searchField.text), "i")
        }
    }
    background: Rectangle {
        anchors.fill: parent
        Kirigami.Theme.colorSet: Kirigami.Theme.View
        color: Kirigami.Theme.backgroundColor
    }
    ColumnLayout {
        spacing: 0
        Repeater {
            focus: true
            model: root.pageStack.wideMode ? filteredModel : 0
            delegate: Kirigami.BasicListItem {
                id: listItem

                required property string title
                required property string targetPage

                label: title
                action: Kirigami.PagePoolAction {
                    pagePool: mainPagePool
                    basePage: pageRoot
                    page: listItem.targetPage
                }
            }
        }
        Kirigami.CardsLayout {
            visible: !root.pageStack.wideMode
            Layout.topMargin: Kirigami.Units.largeSpacing
            Layout.leftMargin: Kirigami.Units.gridUnit
            Layout.rightMargin: Kirigami.Units.gridUnit
            Repeater {
                focus: true
                model: filteredModel
                delegate: Kirigami.Card {
                    id: listItem

                    required property string title
                    required property string targetPage
                    required property string img

                    banner {
                        source: Qt.resolvedUrl(listItem.img)
                        title: listItem.title
                        titleAlignment: Qt.AlignBottom | Qt.AlignLeft
                    }
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        border {
                            width: listItem.activeFocus ? 2 : 0
                            color: Kirigami.Theme.activeTextColor
                        }
                    }
                    activeFocusOnTab: true
                    showClickFeedback: true
                    onClicked: action.trigger()
                    Keys.onReturnPressed: action.trigger()
                    Keys.onEnterPressed: action.trigger()
                    highlighted: action.checked
                    implicitWidth: Kirigami.Units.gridUnit * 30
                    Layout.maximumWidth: Kirigami.Units.gridUnit * 30
                    Kirigami.PagePoolAction {
                        id: action
                        pagePool: mainPagePool
                        basePage: pageRoot
                        page: listItem.targetPage
                    }
                }
            }
        }
    }
}

