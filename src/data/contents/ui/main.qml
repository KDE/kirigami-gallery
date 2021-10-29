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
import org.kde.kitemmodels 1.0

Kirigami.ApplicationWindow {
    id: root

    minimumWidth: Kirigami.Units.gridUnit * 25
    minimumHeight: Kirigami.Units.gridUnit * 20

    ListModel {
        id: galleryModel
        ListElement { title: "Buttons"; page: "ButtonGallery"; img: "buttons.svg" }
        ListElement { title: "Selection Controls"; page: "SelectionControlsGallery"; img: "selection-controls.svg" }
        ListElement { title: "Drawers"; page: "DrawerGallery"; img: "drawers.svg" }
        ListElement { title: "Overlay Sheets"; page: "OverlaySheetGallery"; img: "overlay-sheets.svg" }
        ListElement { title: "Progress Bars"; page: "ProgressBarGallery"; img: "progress-bar.svg" }
        ListElement { title: "Sliders"; page: "SliderGallery"; img: "slider.svg" }
        ListElement { title: "Tab Bar"; page: "TabBarGallery"; img: "tabbar.svg" }
        ListElement { title: "Text Field"; page: "TextFieldGallery"; img: "textfield.svg" }
        ListElement { title: "Form Layout"; page: "FormLayoutGallery"; img: "formlayout.svg" }
        ListElement { title: "Cards Layout"; page: "CardsLayoutGallery"; img: "cardlayout.svg" }
        ListElement { title: "List View with Cards"; page: "CardsListViewGallery"; img: "cardlist.svg" }
        ListElement { title: "Grid View with Cards"; page: "CardsGridViewGallery"; img: "cardgrid.svg" }
        ListElement { title: "Inline Messages"; page: "InlineMessagesGallery"; img: "inlinemessage.svg" }
        ListElement { title: "Multiple Columns"; page: "MultipleColumnsGallery"; img: "columnview.svg" }
        ListElement { title: "Misc. Widgets"; page: "MiscGallery"; img: "miscwidgets.svg" }
        ListElement { title: "List View"; page: "ListViewGallery"; img: "listview.svg" }
        ListElement { title: "List Headers"; page: "ListViewHeaderItemsGallery"; img: "headers.svg" }
        ListElement { title: "Non Scrollable Page"; page: "NonScrollableGallery"; img: "non-scroll-page.svg" }
        ListElement { title: "Action Tool Bar"; page: "ActionToolBarGallery"; img: "action-tool-bar.svg" }
        ListElement { title: "Colors"; page: "ColorsGallery"; img: "colors.svg" }
        ListElement { title: "Color Sets"; page: "ColorSetGallery"; img: "colorsets.svg" }
        ListElement { title: "Metrics"; page: "MetricsGallery"; img: "metrics.svg" }
    }

    KSortFilterProxyModel {
        id: filterModel
        sourceModel: galleryModel
        filterRole: "title"
        filterRegularExpression: {
            if (searchField.text === "") return new RegExp()
            return new RegExp("%1".arg(searchField.text), "i")
        }
    }

    KSortFilterProxyModel {
        id: filterModelMobile
        sourceModel: galleryModel
        filterRole: "title"
        filterRegularExpression: {
            if (headerSearchField.text === "") return new RegExp()
            return new RegExp("%1".arg(headerSearchField.text), "i")
        }
    }

    function suggestSearchText(text) {
        if (searchField.visible) {
            searchField.text = text;
            searchField.forceActiveFocus();
        }
    }

    globalDrawer: Kirigami.OverlayDrawer {
        id: sidebar

        edge: Qt.application.layoutDirection === Qt.RightToLeft ? Qt.RightEdge : Qt.LeftEdge
        modal: !wideScreen
        onModalChanged: drawerOpen = !modal
        handleVisible: !wideScreen
        handleClosedIcon.source: null
        handleOpenIcon.source: null
        drawerOpen: !Kirigami.Settings.isMobile
        width: Kirigami.Units.gridUnit * 16

        Kirigami.Theme.colorSet: Kirigami.Theme.View

        leftPadding: 0
        rightPadding: 0
        topPadding: 0
        bottomPadding: 0

        contentItem: ColumnLayout {
            QQC2.ToolBar {
                id: menu
                visible: !Kirigami.Settings.isMobile
                Layout.fillWidth: true
                Layout.preferredHeight: pageStack.globalToolBar.preferredHeight

                leftPadding: Kirigami.Units.smallSpacing
                rightPadding: Kirigami.Units.smallSpacing
                topPadding: 0
                bottomPadding: 0

                RowLayout {
                    id: searchContainer
                    anchors.fill: parent
                    spacing: Kirigami.Units.smallSpacing

                    QQC2.ToolButton {
                        icon.name: "go-home"
                        enabled: pageStack.currentItem.objectName != "homePage"
                        onClicked: {
                            searchField.text = ""
                            if (pageStack.depth >= 2) {
                                pageStack.pop(null);
                            }
                        }

                        QQC2.ToolTip {
                            text: "Return to the homepage"
                        }
                    }

                    Kirigami.SearchField {
                        id: searchField
                        Layout.fillWidth: true
                    }
                }
            }

            QQC2.ScrollView {
                id: galleryView
                implicitWidth: sidebar.width
                Layout.topMargin: -Kirigami.Units.smallSpacing - 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                QQC2.ScrollBar.horizontal.policy: QQC2.ScrollBar.AlwaysOff
                contentWidth: availableWidth
                clip: true

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 0

                    Repeater {
                        model: filterModel
                        delegate: Kirigami.BasicListItem {
                            label: title
                            reserveSpaceForIcon: false
                            onClicked: {
                                if (pageStack.depth >= 2) {
                                    pageStack.pop();
                                }
                                pageStack.push(`qrc:/${page}.qml`);
                                if (Kirigami.Settings.isMobile) {
                                    sidebar.close();
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    pageStack.initialPage: Kirigami.ScrollablePage {
        id: homePage
        objectName: "homePage"

        title: "Kirigami Gallery"

        actions {
            main: Kirigami.Action {
                text: "Global Tool Bar Style..."
                iconName: "view-list-icons"
                Kirigami.Action {
                        text: "Auto"
                        onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.Auto
                        checked: root.pageStack.globalToolBar.style == Kirigami.ApplicationHeaderStyle.Auto
                }
                Kirigami.Action {
                        text: "Breadcrumb"
                        onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.Breadcrumb
                        checked: root.pageStack.globalToolBar.style == Kirigami.ApplicationHeaderStyle.Breadcrumb
                }
                Kirigami.Action {
                        text: "TabBar"
                        onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.TabBar
                        checked: root.pageStack.globalToolBar.style == Kirigami.ApplicationHeaderStyle.TabBar
                }
                Kirigami.Action {
                        text: "Titles"
                        onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.Titles
                        checked: root.pageStack.globalToolBar.style == Kirigami.ApplicationHeaderStyle.Titles
                }
                Kirigami.Action {
                        text: "ToolBar"
                        visible: !Kirigami.Settings.isMobile
                        onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.ToolBar
                        checked: root.pageStack.globalToolBar.style == Kirigami.ApplicationHeaderStyle.ToolBar
                }
                Kirigami.Action {
                        text: "None"
                        onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.None
                        checked: root.pageStack.globalToolBar.style == Kirigami.ApplicationHeaderStyle.None
                }
            }
        }

        header: QQC2.ToolBar {
            id: toolbar
            visible: Kirigami.Settings.isMobile
            height: visible ? implicitHeight : 0
            RowLayout {
                anchors.fill: parent
                Kirigami.SearchField {
                    id: headerSearchField

                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    Layout.maximumWidth: Kirigami.Units.gridUnit * 30
                }
            }
        }

        Kirigami.CardsLayout {
            Layout.topMargin: Kirigami.Units.largeSpacing
            Layout.leftMargin: Kirigami.Units.gridUnit
            Layout.rightMargin: Kirigami.Units.gridUnit
            maximumColumns: 5
            Repeater {
                focus: true
                model: Kirigami.Settings.isMobile ? filterModelMobile : filterModel
                delegate: Kirigami.Card {
                    id: listItem
                    banner {
                        source: img
                        title: title
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
                    Kirigami.Action {
                        id: action
                        onTriggered: {
                            pageStack.push(`qrc:/${page}.qml`);
                        }
                    }
                }
            }
        }

        readonly property var readableCharacters: /\w+/
        Keys.onPressed: {
            if(event.text.length > 0 && event.modifiers === Qt.NoModifier && event.text.match(readableCharacters)) {
                root.suggestSearchText(event.text);
            }
        }
    }
}
