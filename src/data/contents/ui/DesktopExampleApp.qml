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
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.4 as Kirigami
import "gallery"

Kirigami.ApplicationWindow {
    id: root

    globalDrawer: Kirigami.GlobalDrawer {
        title: "Widget gallery"
        titleIcon: "applications-graphics"
        bannerImageSource: "banner.jpg"

        actions: [
            Kirigami.Action {
                text: "Top Bar Style..."
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
            },
            Kirigami.Action {
                text: "Top Bar Sizing..."
                iconName: "folder-sync"
                visible: Kirigami.Settings.isMobile
                Kirigami.Action {
                        text: "Slide Away"
                        onTriggered: {
                            root.pageStack.globalToolBar.minimumHeight = 0;
                            root.pageStack.globalToolBar.preferredHeight = 42;
                        }
                        checked: root.pageStack.globalToolBar.minimumHeight == 0
                }
                Kirigami.Action {
                        text: "Fixed"
                        onTriggered: {
                            root.pageStack.globalToolBar.minimumHeight = 42;
                            root.pageStack.globalToolBar.preferredHeight = 42;
                        }
                        checked: root.pageStack.globalToolBar.minimumHeight == 42
                }
                Kirigami.Action {
                        text: "Resizing"
                        onTriggered: {
                            root.pageStack.globalToolBar.minimumHeight = 20;
                            root.pageStack.globalToolBar.preferredHeight = 52;
                        }
                        checked: root.pageStack.globalToolBar.minimumHeight == 20
                }
            },
            Kirigami.Action {
                text: "Global Drawer Mode..."
                iconName: "go-next"
                visible: !Kirigami.Settings.isMobile
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
                text: "Title style..."
                iconName: "format-border-set-top"
                Kirigami.Action {
                    text: "Title And Image"
                    checked: root.globalDrawer.title.length > 0 && 
                        root.globalDrawer.bannerImageSource.toString().length > 0
                    onTriggered: {
                        root.globalDrawer.title = "Widget gallery"
                        root.globalDrawer.titleIcon = "applications-graphics"
                        root.globalDrawer.bannerImageSource = "banner.jpg"
                    }
                }
                Kirigami.Action {
                    text: "Title Only"
                    checked: root.globalDrawer.title.length > 0 && 
                        root.globalDrawer.bannerImageSource.toString().length == 0
                    onTriggered: {
                        root.globalDrawer.title = "Widget gallery"
                        root.globalDrawer.titleIcon = "applications-graphics"
                        root.globalDrawer.bannerImageSource = ""
                    }
                }
                Kirigami.Action {
                    text: "None"
                    checked: root.globalDrawer.title.length == 0 && 
                        root.globalDrawer.bannerImageSource.toString().length == 0
                    onTriggered: {
                        root.globalDrawer.title = ""
                        root.globalDrawer.titleIcon = "";
                        root.globalDrawer.bannerImageSource = ""
                    }
                }
            },
            Kirigami.Action {
                text: "Open A Page"
                checkable: true
                //Need to do this, otherwise it breaks the bindings
                property bool current: pageStack.currentItem ? pageStack.currentItem.objectName == "settingsPage" : false
                onCurrentChanged: {
                    checked = current;
                }
                onTriggered: {
                    pageStack.push(settingsComponent);
                }
            },
            Kirigami.Action {
                text: "Open A Layer"
                icon {
                    name: "configure"
                    color: Kirigami.Theme.activeTextColor
                }
                onTriggered: {
                    pageStack.layers.push(Qt.resolvedUrl("gallery/LayersGallery.qml"));
                }
            }
            ]

        Controls.CheckBox {
            text: "Slow Animations"
            onCheckedChanged: {
                if (checked) {
                    Kirigami.Units.longDuration = 2500
                    Kirigami.Units.shortDuration = 1500
                } else {
                    Kirigami.Units.longDuration = 250
                    Kirigami.Units.shortDuration = 150
                }
            }
        }
        Controls.CheckBox {
            checked: true
            text: "Option 2"
        }
        Controls.CheckBox {
            text: "Option 3"
        }
        Controls.Slider {
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
                Controls.Button {
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
