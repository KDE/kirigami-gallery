// Copyright 2023 Joshua Goins <josh@redstrate.com>
//
// SPDX-License-Identifier: LGPL-2.0-or-later

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.Page {
    id: page

    title: "Navigation Tab Bar"

    actions: KGC.InfoSheetAction {
        page: page
        component: "NavigationTabBarGallery"
    }
    QQC2.SwipeView {
        id: swipeView
        anchors.fill: parent
        clip: true
        onCurrentIndexChanged: footer.currentIndex = currentIndex
        Kirigami.Page {
            id: worldPage
            title: "World"
            QQC2.Label {
                anchors.centerIn: parent
                text: "Current Page: World"
            }
        }
        Kirigami.Page {
            id: timersPage
            title: "Timers"
            QQC2.Label {
                anchors.centerIn: parent
                text: "Current Page: Timers"
            }
        }
        Kirigami.Page {
            id: stopwatchPage
            title: "Stopwatch"
            QQC2.Label {
                anchors.centerIn: parent
                text: "Current Page: Stopwatch"
            }
        }
        Kirigami.Page {
            id: alarmsPage
            title: "Alarms"
            QQC2.Label {
                anchors.centerIn: parent
                text: "Current Page: Alarms"
            }
        }
    }

    footer: Kirigami.NavigationTabBar {
        actions: [
            Kirigami.Action {
                icon.name: "globe"
                text: "World"
                checked: true
                onTriggered: swipeView.currentIndex = footer.currentIndex
            },
            Kirigami.Action {
                icon.name: "player-time"
                text: "Timers"
                onTriggered: swipeView.currentIndex = footer.currentIndex
            },
            Kirigami.Action {
                icon.name: "chronometer"
                text: "Stopwatch"
                onTriggered: swipeView.currentIndex = footer.currentIndex
            },
            Kirigami.Action {
                icon.name: "notifications"
                text: "Alarms"
                onTriggered: swipeView.currentIndex = footer.currentIndex
            }
        ]
    }
}
