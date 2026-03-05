/*
 *   SPDX-FileCopyrightText: 2026 Nate Graham <nate@kde.org>
 *
 *   SPDX-License-Identifier: LGPL-2.0-or-later
 */

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    Layout.fillWidth: true

    title: qsTr("Badges")

    actions: KGC.InfoSheetAction {
        page: page
        component: "BadgeGallery"
    }

    Kirigami.FormLayout {
        anchors.fill: parent

        Item {
            Kirigami.FormData.label: qsTr("Number badges")
            Kirigami.FormData.isSection: true
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Short number:")
            text: "1"
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Medium number:")
            text: "25"
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Large number:")
            text: "999"
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Very large number:")
            text: qsTr("99,999")
        }

        Item {
            Kirigami.FormData.label: qsTr("Primarily text badges")
            Kirigami.FormData.isSection: true
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Default background and text color:")
            text: qsTr("New!")
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Super compact version with custom background color:")
            text: qsTr("Integrated GPU")
            padding: 0
            backgroundColor: Kirigami.Theme.visitedLinkBackgroundColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label with custom background color:")
            icon.name: "lock"
            text: qsTr("Encrypted for your convenience")
            backgroundColor: Kirigami.Theme.positiveBackgroundColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label with custom background and text color:")
            icon.name: "favorite-favorited-symbolic"
            text: qsTr("Favorite")
            backgroundColor: Kirigami.Theme.visitedLinkColor
            textColor: Kirigami.Theme.highlightedTextColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Awkwardly long string, bounded length:")
            Layout.maximumWidth: 150
            text: qsTr("Your computer is about to explode; please calmly proceed to the nearest exit")
            backgroundColor: Kirigami.Theme.negativeBackgroundColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + awkwardly long string, bounded length:")
            Layout.maximumWidth: 150
            icon.name: "edit-bomb"
            text: qsTr("Your computer is about to explode; please calmly proceed to the nearest exit")
            backgroundColor: Kirigami.Theme.negativeBackgroundColor
        }

        Item {
            Kirigami.FormData.label: "Icons-only badges"
            Kirigami.FormData.isSection: true
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Symbolic icon, should be tinted with background color:")
            icon.name: "edit-bomb-symbolic"
            backgroundColor: Kirigami.Theme.negativeBackgroundColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Non-symbolic icon, should look colorful:")
            icon.name: "kde"
            backgroundColor: Kirigami.Theme.activeBackgroundColor
        }
    }
}

