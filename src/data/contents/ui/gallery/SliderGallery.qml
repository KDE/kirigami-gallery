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

import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.20

ScrollablePage {
    id: page
    Layout.fillWidth: true

    title: "Sliders"

    actions {
        left: Action {
            icon.name: "folder-sync"
            text: "Left Action Text"
            onTriggered: {
                showPassiveNotification("Left action triggered")
            }
        }
        right: Action {
            icon.name: "configure"
            text: "Right Action Text"
            onTriggered: {
                showPassiveNotification("Right action triggered")
            }
        }
    }

    FormLayout {
        id: formLayout
        Controls.Slider {
            FormData.label: "Normal Slider:"
            id: normalSlider
            Layout.minimumWidth: Units.gridUnit * 15
            value: 1
            to: 5.0
        }
        Controls.Slider {
            id: disabledSlider
            FormData.label: "Disabled Slider:"
            enabled: false
            Layout.minimumWidth: Units.gridUnit * 15
            value: 2
            to: 5.0
        }
        Controls.Slider {
            FormData.label: "Slider with tickmarks:"
            id: tickmarkSlider
            Layout.minimumWidth: Units.gridUnit * 15
            to: 5.0
            stepSize: 1.0
            value: 3
        }
        Controls.RangeSlider {
            FormData.label: "Range Slider:"
            id: normalRangeSlider
            Layout.minimumWidth: Units.gridUnit * 15
            to: 5.0
            first.value: 0
            second.value: 4
        }
        RowLayout {
            FormData.label: "Vertical Sliders:"
            FormData.labelAlignment: Qt.AlignTop
            Layout.preferredWidth: normalSlider.width

            Controls.Slider {
                id: verticalNormalSlider
                Layout.minimumWidth: 2
                Layout.minimumHeight: Units.gridUnit * 10
                Layout.fillHeight: true
                value: 2
                to: 5.0
                orientation: Qt.Vertical
            }
            Item { Layout.fillWidth: true }
            Controls.Slider {
                Layout.minimumWidth: 2
                Layout.minimumHeight: Units.gridUnit * 10
                Layout.fillHeight: true
                value: 3
                to: 5.0
                stepSize: 1.0
                orientation: Qt.Vertical
            }
            Item { Layout.fillWidth: true }
            Controls.RangeSlider {
                Layout.minimumWidth: 2
                Layout.minimumHeight: Units.gridUnit * 10
                Layout.fillHeight: true
                to: 5.0
                first.value: 0
                second.value: 4
                orientation: Qt.Vertical
            }
        }
    }
}
