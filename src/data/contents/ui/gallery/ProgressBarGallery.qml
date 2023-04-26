// SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
// SPDX-FileCopyrightText: 2022 ivan tkachenko <me@ratijas.tk>
// SPDX-FileCopyrightText: 2023 Carl Schwan <carl@carlschwan.eu>
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2
import QtQuick.Controls 2 as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: page

    title: "Progress Indicators"

    actions: [
        Kirigami.Action {
            icon.name: "document-edit"
            text: "Main Action Text"
            onTriggered: showPassiveNotification("Main action triggered");
        },
        Kirigami.Action {
            icon.name: "folder-sync"
            text: "Right Action Text"
            onTriggered: showPassiveNotification("Right action triggered")
        }
    ]

    ColumnLayout {
        width: page.width

        GridLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.leftMargin: Kirigami.Units.gridUnit
            Layout.rightMargin: Kirigami.Units.gridUnit

            rowSpacing: Kirigami.Units.largeSpacing
            columns: 2

            QQC2.Label {
                text: "Determinate:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.ProgressBar {
                from: 0
                to: 100
                Layout.maximumWidth: Kirigami.Units.gridUnit * 10

                SequentialAnimation on value {
                    running: true
                    loops: Animation.Infinite

                    NumberAnimation {
                        from: 0
                        to: 100
                        duration: 8000
                        easing.type: Easing.Linear
                    }
                    PauseAnimation {
                        duration: 1000
                    }
                }
            }
            QQC2.Label {
                text: "Indeterminate:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.ProgressBar {
                from: 0
                to: 100
                indeterminate: true
                Layout.maximumWidth: Kirigami.Units.gridUnit * 10
            }
            QQC2.Label {
                text: "Busy indicator:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.BusyIndicator {

            }
            QQC2.Label {
                text: "Inactive indicator:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.BusyIndicator {
                running: false
            }
            QQC2.Label {
                text: "Custom size:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.BusyIndicator {
                Layout.minimumWidth: Kirigami.Units.iconSizes.enormous
                Layout.minimumHeight: width
            }
        }
    }
}
