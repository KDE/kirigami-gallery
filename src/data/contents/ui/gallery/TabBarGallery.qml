/*
 *   Copyright 2016 Marco Martin <mart@kde.org>
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

import QtQuick
import QtQuick.Controls as QQC2
import org.kde.kirigami as Kirigami

Kirigami.Page {
    id: page

    title: "Tab Bar"

    header: QQC2.TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        QQC2.TabButton {
            text: "First"
        }
        QQC2.TabButton {
            text: "Second"
        }
        QQC2.TabButton {
            text: "Third"
        }
    }

    QQC2.SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        clip: true

        Repeater {
            model: 3

            Item {
                QQC2.Label {
                    width: parent.width
                    wrapMode: QQC2.Label.Wrap
                    horizontalAlignment: Qt.AlignHCenter
                    text: "Page " + modelData
                }
                QQC2.TabBar {
                    position: QQC2.TabBar.Footer
                    anchors {
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                    QQC2.TabButton {
                        text: "First"
                    }
                    QQC2.TabButton {
                        text: "Second"
                    }
                }
            }
        }
    }
}
