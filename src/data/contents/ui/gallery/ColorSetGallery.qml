/*
 *   Copyright 2017 Marco Martin <mart@kde.org>
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
import "components" as KGC


Kirigami.ScrollablePage {
    id: page
    title: "Color Sets"

    actions: KGC.InfoSheetAction {
        page: page
        component: "ColorSetGallery"
    }

    background: Rectangle {
        color: Kirigami.Theme.backgroundColor
    }

    ColumnLayout {
        GridLayout {
            columns: 2
            QQC2.Label {
                text: "Global Drawer color set:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.ComboBox {
                Kirigami.Theme.inherit: true
                currentIndex: 0
                model: ["View", "Window", "Button", "Selection", "Tooltip", "Complementary", "Header"]
                onCurrentTextChanged: applicationWindow().globalDrawer.Kirigami.Theme.colorSet = currentText
            }

            QQC2.Label {
                text: "Page color set:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.ComboBox {
                Kirigami.Theme.inherit: true
                currentIndex: 1
                model: ["View", "Window", "Button", "Selection", "Tooltip", "Complementary", "Header"]
                onCurrentTextChanged: page.Kirigami.Theme.colorSet = currentText
            }
        }

        QQC2.Frame {
            Kirigami.Theme.inherit: true
            Layout.minimumHeight: childrenRect.height
            Layout.fillWidth: true
            height: childrenRect.height
            background: Rectangle {
                color: Kirigami.Theme.backgroundColor
            }
            contentItem: ColumnLayout {
                spacing: 0
                QQC2.Label {
                    text: "Set inherited from parent Item"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    icon.name: "view-right-close"
                    text: "Delegate1"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    text: "Delegate2"
                }
            }
        }

        QQC2.Frame {
            Kirigami.Theme.inherit: false
            Kirigami.Theme.colorSet: Kirigami.Theme.Window
            Layout.minimumHeight: childrenRect.height
            Layout.fillWidth: true
            height: childrenRect.height
            background: Rectangle {
                color: Kirigami.Theme.backgroundColor
            }
            contentItem: ColumnLayout {
                spacing: 0
                QQC2.Label {
                    text: "Window Set"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    icon.name: "view-right-close"
                    text: "Delegate1"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    text: "Delegate2"
                }
            }
        }

        QQC2.Frame {
            Kirigami.Theme.inherit: false
            Kirigami.Theme.colorSet: Kirigami.Theme.View
            Layout.minimumHeight: childrenRect.height
            Layout.fillWidth: true
            height: childrenRect.height
            background: Rectangle {
                color: Kirigami.Theme.backgroundColor
            }
            contentItem: ColumnLayout {
                spacing: 0
                QQC2.Label {
                    text: "View Set"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    icon.name: "view-right-close"
                    text: "Delegate1"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    text: "Delegate2"
                }
            }
        }

        QQC2.Frame {
            Kirigami.Theme.inherit: false
            Kirigami.Theme.colorSet: Kirigami.Theme.Complementary
            Layout.minimumHeight: childrenRect.height
            Layout.fillWidth: true
            height: childrenRect.height
            background: Rectangle {
                color: Kirigami.Theme.backgroundColor
            }
            contentItem: ColumnLayout {
                spacing: 0
                QQC2.Label {
                    text: "Complementary Set"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    icon.name: "view-right-close"
                    text: "Delegate1"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    text: "Delegate2"
                }
            }
        }

        QQC2.Frame {
            Kirigami.Theme.inherit: false
            Kirigami.Theme.colorSet: Kirigami.Theme.Window
            Kirigami.Theme.backgroundColor: "#b9d795"
            Kirigami.Theme.textColor: "#465c2b"
            Kirigami.Theme.highlightColor: "#89e51c"
            Layout.minimumHeight: childrenRect.height
            Layout.fillWidth: true
            height: childrenRect.height
            background: Rectangle {
                color: Kirigami.Theme.backgroundColor
            }
            contentItem: ColumnLayout {
                spacing: 0
                QQC2.Label {
                    text: "Window set with Custom Colors"
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.max(implicitHeight, button.implicitHeight + 2 * Kirigami.Units.largeSpacing)
                    icon.name: "view-right-close"
                    text: "Delegate1"

                    QQC2.Button {
                        id: button
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                            rightMargin: Kirigami.Units.largeSpacing
                        }
                        Kirigami.Theme.inherit: true
                        text: "Dynamic Color Button"
                        icon.name: "go-next"
                    }
                }
                Kirigami.SubtitleDelegate {
                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.max(implicitHeight, textField.implicitHeight + 2 * Kirigami.Units.largeSpacing)
                    text: "Delegate2"

                    QQC2.TextField {
                        id: textField
                        anchors {
                            right: parent.right
                            verticalCenter: parent.verticalCenter
                            rightMargin: Kirigami.Units.largeSpacing
                        }
                        Kirigami.Theme.inherit: true
                        text: "Dynamic Color Text field"
                    }
                }
            }
        }

        QQC2.Button {
            Kirigami.Theme.colorSet: Kirigami.Theme.Button
            Kirigami.Theme.inherit: false
            text: "Fixed Color Button"
            icon.name: "go-next"
        }
        QQC2.Button {
            Kirigami.Theme.inherit: true
            text: "Dynamic Color Button"
            icon.name: "go-next"
        }
        Kirigami.Icon {
            id: customColorIcon
            source: "view-right-close"
            color: "green"
            Layout.minimumWidth: 32
            Layout.minimumHeight: 32
        }
        Flow {
            Layout.fillWidth: true
            QQC2.Label {
                text: "RGB color for icon:"
            }
            QQC2.SpinBox{
                id: red
                editable: true
                from: 0
                to: 255
                onValueChanged: {
                    customColorIcon.color = Qt.rgba(red.value/255, green.value/255, blue.value/255, 1);
                }
            }
            QQC2.SpinBox{
                id: green
                editable: true
                from: 0
                to: 255
                value: 255
                onValueChanged: {
                    customColorIcon.color = Qt.rgba(red.value/255, green.value/255, blue.value/255, 1);
                }
            }
            QQC2.SpinBox{
                id: blue
                editable: true
                from: 0
                to: 255
                onValueChanged: {
                    customColorIcon.color = Qt.rgba(red.value/255, green.value/255, blue.value/255, 1);
                }
            }
        }
    }
}
