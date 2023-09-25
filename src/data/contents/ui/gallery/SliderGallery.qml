// SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
// SPDX-FileCopyrightText: 2022 ivan tkachenko <me@ratijas.tk>
// SPDX-FileCopyrightText: 2022 Carl Schwan <carl@carlschwan.eu>
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.ScrollablePage {
    id: page

    title: "Sliders"

    actions: [
        Kirigami.Action {
            icon.name: "folder-sync"
            text: "Left Action Text"
            onTriggered: showPassiveNotification("Left action triggered")
        },
        Kirigami.Action {
            icon.name: "configure"
            text: "Right Action Text"
            onTriggered: showPassiveNotification("Right action triggered")
        }
    ]

    Kirigami.FormLayout {
        id: formLayout

        QQC2.Slider {
            id: normalSlider
            value: 1
            to: 5.0
            Kirigami.FormData.label: "Normal Slider:"
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
        }

        QQC2.Slider {
            id: disabledSlider
            enabled: false
            value: 2
            to: 5.0
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
            Kirigami.FormData.label: "Disabled Slider:"
        }

        QQC2.Slider {
            id: tickmarkSlider
            to: 5.0
            stepSize: 1.0
            value: 3
            Kirigami.FormData.label: "Slider with tickmarks:"
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
        }

        QQC2.RangeSlider {
            id: normalRangeSlider
            to: 5.0
            first.value: 0
            second.value: 4
            Kirigami.FormData.label: "Range Slider:"
            Layout.minimumWidth: Kirigami.Units.gridUnit * 15
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
