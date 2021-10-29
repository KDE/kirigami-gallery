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

    title: "Sliders"

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
        Item {
            Kirigami.FormData.label: "Vertical Sliders:"
        }
        RowLayout {
            spacing: Math.round(normalSlider.width / 3)
            
            QQC2.Slider {
                id: verticalNormalSlider
                Layout.minimumWidth: 2
                Layout.minimumHeight: Kirigami.Units.gridUnit * 10
                Layout.fillHeight: true
                value: 2
                to: 5.0
                orientation: Qt.Vertical
            }
            QQC2.Slider {
                Layout.minimumWidth: 2
                Layout.minimumHeight: Kirigami.Units.gridUnit * 10
                Layout.fillHeight: true
                value: 3
                to: 5.0
                stepSize: 1.0
                orientation: Qt.Vertical
            }
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

