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
import org.kde.kirigami as Kirigami
import "gallery"

Kirigami.ApplicationWindow {
    id: root

    minimumHeight: Kirigami.Units.gridUnit * 20
    minimumWidth: Kirigami.Units.gridUnit * 20

    globalDrawer: Kirigami.GlobalDrawer {
        id: globalDrawer
        title: "Widget gallery"
        titleIcon: "applications-graphics"

        showHeaderWhenCollapsed: true
        header: RowLayout {
            Layout.fillWidth: true
            QQC2.ToolButton {
                icon.name: "application-menu"
                visible: globalDrawer.collapsible
                checked: !globalDrawer.collapsed
                onClicked: globalDrawer.collapsed = !globalDrawer.collapsed
            }
            Kirigami.SearchField {
                visible: !globalDrawer.collapsed
                Layout.fillWidth: true
            }
        }

        actions: [
            Kirigami.Action {
                text: "Top Bar Style…"
                icon.name: "view-list-icons-symbolic"
                Kirigami.Action {
                    text: "Auto"
                    onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.Auto
                    checked: root.pageStack.globalToolBar.style === Kirigami.ApplicationHeaderStyle.Auto
                }
                Kirigami.Action {
                    text: "Breadcrumb"
                    onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.Breadcrumb
                    checked: root.pageStack.globalToolBar.style === Kirigami.ApplicationHeaderStyle.Breadcrumb
                }
                Kirigami.Action {
                    text: "Titles"
                    onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.Titles
                    checked: root.pageStack.globalToolBar.style === Kirigami.ApplicationHeaderStyle.Titles
                }
                Kirigami.Action {
                    text: "ToolBar"
                    visible: !Kirigami.Settings.isMobile
                    onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.ToolBar
                    checked: root.pageStack.globalToolBar.style === Kirigami.ApplicationHeaderStyle.ToolBar
                }
                Kirigami.Action {
                    text: "None"
                    onTriggered: root.pageStack.globalToolBar.style = Kirigami.ApplicationHeaderStyle.None
                    checked: root.pageStack.globalToolBar.style === Kirigami.ApplicationHeaderStyle.None
                }
            },
            Kirigami.Action {
                text: "Top Bar Sizing…"
                icon.name: "resizerow-symbolic"
                visible: Kirigami.Settings.isMobile
                Kirigami.Action {
                    text: "Slide Away"
                    onTriggered: {
                        root.pageStack.globalToolBar.minimumHeight = 0;
                        root.pageStack.globalToolBar.preferredHeight = 42;
                    }
                    checked: root.pageStack.globalToolBar.minimumHeight === 0
                }
                Kirigami.Action {
                    text: "Fixed"
                    onTriggered: {
                        root.pageStack.globalToolBar.minimumHeight = 42;
                        root.pageStack.globalToolBar.preferredHeight = 42;
                    }
                    checked: root.pageStack.globalToolBar.minimumHeight === 42
                }
                Kirigami.Action {
                    text: "Resizing"
                    onTriggered: {
                        root.pageStack.globalToolBar.minimumHeight = 20;
                        root.pageStack.globalToolBar.preferredHeight = 52;
                    }
                    checked: root.pageStack.globalToolBar.minimumHeight === 20
                }
            },
            Kirigami.Action {
                text: "Global Drawer Mode…"
                icon.name: globalDrawer.edge === Qt.RightEdge ? "sidebar-collapse-right-symbolic" : "sidebar-collapse-left-symbolic"
                visible: !Kirigami.Settings.isMobile
                expandible: true
                Kirigami.Action {
                    text: "Overlay Drawer"
                    checked: globalDrawer.modal && !globalDrawer.collapsible
                    onTriggered: {
                        globalDrawer.modal = true;
                        globalDrawer.collapsible = false;
                        globalDrawer.collapsed = false;
                    }
                }
                Kirigami.Action {
                    text: "Sidebar Drawer"
                    checked: !globalDrawer.modal && !globalDrawer.collapsible
                    onTriggered: {
                        globalDrawer.modal = false;
                        globalDrawer.collapsible = false;
                        globalDrawer.collapsed = false;
                    }
                }
                Kirigami.Action {
                    text: "Collapsible Sidebar Drawer"
                    checked: !globalDrawer.modal && globalDrawer.collapsible
                    onTriggered: {
                        globalDrawer.modal = false;
                        globalDrawer.collapsible = true;
                        globalDrawer.collapsed = true;
                    }
                }
            },
            Kirigami.Action {
                text: "Title style…"
                icon.name: "format-border-set-top-symbolic"
                Kirigami.Action {
                    text: "Title And Image"
                    checked: root.globalDrawer.title.length > 0
                    enabled: globalDrawer.bannerVisible
                    onTriggered: {
                        root.globalDrawer.title = "Widget gallery"
                        root.globalDrawer.titleIcon = "applications-graphics"
                    }
                }
                Kirigami.Action {
                    text: "Title Only"
                    checked: root.globalDrawer.title.length > 0
                    enabled: globalDrawer.bannerVisible
                    onTriggered: {
                        root.globalDrawer.title = "Widget gallery"
                        root.globalDrawer.titleIcon = "applications-graphics"
                    }
                }
                Kirigami.Action {
                    text: "None"
                    checked: root.globalDrawer.title.length === 0
                    enabled: globalDrawer.bannerVisible
                    onTriggered: {
                        root.globalDrawer.title = ""
                        root.globalDrawer.titleIcon = "";
                    }
                }
            },
            Kirigami.Action {
                text: "Open A Page"
                icon.name: "view-pages-single-symbolic"
                //Need to do this, otherwise it breaks the bindings
                property bool current: pageStack.currentItem ? pageStack.currentItem.objectName === "settingsPage" : false
                onCurrentChanged: {
                    checked = current;
                }
                onTriggered: {
                    pageStack.push(settingsComponent);
                }
            },
            Kirigami.Action {
                text: "Open A Layer"
                icon.name: "dialog-layers-symbolic"
                onTriggered: {
                    pageStack.layers.push(Qt.resolvedUrl("gallery/LayersGallery.qml"));
                }
            }
        ]

        QQC2.CheckBox {
            checked: true
            text: "Option 2"
        }
        QQC2.CheckBox {
            text: "Option 3"
        }
        QQC2.Slider {
            Layout.fillWidth: true
            value: 0.5
        }
    }

    pageStack.initialPage: mainPageComponent

    Component {
        id: settingsComponent
        Kirigami.Page {
            title: "Settings"
            objectName: "settingsPage"
            Rectangle {
                anchors.fill: parent
                QQC2.Button {
                    anchors.centerIn: parent
                    text: "Remove Page"
                    onClicked: applicationWindow().pageStack.pop();
                }
            }
        }
    }

    //Main app content
    Component {
        id: mainPageComponent
        MainPage {}
    }

}
