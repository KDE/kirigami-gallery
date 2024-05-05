// Copyright 2023 Joshua Goins <josh@redstrate.com>
//
// SPDX-License-Identifier: LGPL-2.0

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.Page {
    id: page

    title: "Navigation Tab Bar"

    ColumnLayout {
        anchors.centerIn: parent

        QQC2.Label {
            id: pageLabel

            text: "Current Page: World"
        }
    }

    footer: Kirigami.NavigationTabBar {
        actions: [
            Kirigami.Action {
                icon.name: "globe"
                text: "World"
                checked: true
                onTriggered: pageLabel.text = "Current Page: World"
            },
            Kirigami.Action {
                icon.name: "player-time"
                text: "Timers"
                onTriggered: pageLabel.text = "Current Page: Timers"
            },
            Kirigami.Action {
                icon.name: "chronometer"
                text: "Stopwatch"
                onTriggered: pageLabel.text = "Current Page: Stopwatch"
            },
            Kirigami.Action {
                icon.name: "notifications"
                text: "Alarms"
                onTriggered: pageLabel.text = "Current Page: Alarms"
            }
        ]
    }
}
