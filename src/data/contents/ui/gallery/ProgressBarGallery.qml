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

Kirigami.ScrollablePage {
    id: page

    title: "Progress Indicators"

    ColumnLayout {
        width: page.width
            Timer {
                id: timer
                property int value: 0
                interval: 80
                repeat: true
                running: true
                onTriggered: {
                    value = (value + 1) % 100
                }
            }

        GridLayout {
            anchors.centerIn: parent
            rowSpacing: Kirigami.Units.largeSpacing
            columns: 2
            width: parent.width - Kirigami.Units.gridUnit*2

            QQC2.Label {
                text: "Determinate:"
                Layout.alignment: Qt.AlignRight
            }
            QQC2.ProgressBar {
                from: 0
                to: 100
                value: timer.value
                Layout.maximumWidth: Kirigami.Units.gridUnit * 10
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
