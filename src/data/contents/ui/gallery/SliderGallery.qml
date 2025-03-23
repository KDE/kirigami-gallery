/*
 *   Copyright 2015 Marco Martin <mart@kde.org>
 *   Copyright 2022 ivan tkachenko <me@ratijas.tk>
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
    Layout.fillWidth: true

    title: "Sliders"

    actions: [
        KGC.InfoSheetAction {
            page: page
            component: "SliderGallery"
        },
        Kirigami.Action {
            icon.name: "folder-sync"
            text: "Left Action Text"
            onTriggered: {
                showPassiveNotification("Left action triggered")
            }
        },
        Kirigami.Action {
            icon.name: "configure"
            text: "Right Action Text"
            onTriggered: {
                showPassiveNotification("Right action triggered")
            }
        }
    ]

    Kirigami.FormLayout {
        id: formLayout
        QQC2.Slider {
            Kirigami.FormData.label: "Normal Slider:"
            id: normalSlider
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
            value: 1
            to: 5.0
        }
        QQC2.Slider {
            id: disabledSlider
            Kirigami.FormData.label: "Disabled Slider:"
            enabled: false
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
            value: 2
            to: 5.0
        }
        QQC2.Slider {
            Kirigami.FormData.label: "Slider with tickmarks:"
            id: tickmarkSlider
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
            to: 5.0
            stepSize: 1.0
            value: 3
        }
        QQC2.RangeSlider {
            Kirigami.FormData.label: "Range Slider:"
            id: normalRangeSlider
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
            to: 5.0
            first.value: 0
            second.value: 4
        }
        RowLayout {
            Kirigami.FormData.label: "Vertical Sliders:"
            Kirigami.FormData.labelAlignment: Qt.AlignTop
            Layout.preferredWidth: normalSlider.width

            QQC2.Slider {
                id: verticalNormalSlider
                Layout.minimumWidth: 2
                Layout.minimumHeight: Kirigami.Units.gridUnit * 10
                Layout.fillHeight: true
                value: 2
                to: 5.0
                orientation: Qt.Vertical
            }
            Item { Layout.fillWidth: true }
            QQC2.Slider {
                Layout.minimumWidth: 2
                Layout.minimumHeight: Kirigami.Units.gridUnit * 10
                Layout.fillHeight: true
                value: 3
                to: 5.0
                stepSize: 1.0
                orientation: Qt.Vertical
            }
            Item { Layout.fillWidth: true }
            QQC2.RangeSlider {
                Layout.minimumWidth: 2
                Layout.minimumHeight: Kirigami.Units.gridUnit * 10
                Layout.fillHeight: true
                to: 5.0
                first.value: 0
                second.value: 4
                orientation: Qt.Vertical
            }
        }
    }
}
