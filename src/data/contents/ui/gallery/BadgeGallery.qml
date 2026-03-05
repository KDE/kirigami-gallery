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
            Kirigami.FormData.label: qsTr("Skinny Roman numeral:")
            text: "III"
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
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Negative number:")
            text: qsTr("-666")
            type: Kirigami.Badge.Type.Error
        }

        Item {
            Kirigami.FormData.label: qsTr("Badges with text")
            Kirigami.FormData.isSection: true
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Default background and text color:")
            text: qsTr("New!")
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label, positive:")
            icon.name: "lock-symbolic"
            text: qsTr("Encrypted")
            type: Kirigami.Badge.Type.Positive
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label, warning:")
            icon.name: "unlock-symbolic"
            text: qsTr("Unencrypted")
            type: Kirigami.Badge.Type.Warning
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label with custom  background color:")
            icon.name: "favorite-favorited-symbolic"
            text: qsTr("Favorite")
            customColor: Kirigami.Theme.visitedLinkColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Super compact versions with icons and all custom colors:")
            text: qsTr("Integrated GPU")
            padding: 0
            icon.name: "battery-profile-powersave-symbolic"
            customColor: "powderblue"
            customTextColor: "blue"
        }
        Kirigami.Badge {
            text: qsTr("Dedicated GPU")
            padding: 0
            icon.name: "edit-bomb-symbolic"
            customColor: "lightgreen"
            customTextColor: "darkgreen"
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Awkwardly long string, bounded length:")
            Layout.maximumWidth: 150
            text: qsTr("Turbo-encabulated; always fresh, never frozen")
            type: Kirigami.Badge.Type.Positive
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + awkwardly long string, bounded length:")
            Layout.maximumWidth: 150
            icon.name: "edit-bomb-symbolic"
            text: qsTr("The computer is about to explode; please proceed calmly to the nearest exit")
            type: Kirigami.Badge.Type.Error
        }

        Item {
            Kirigami.FormData.label: "Icons-only badges"
            Kirigami.FormData.isSection: true
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Symbolic icon:")
            icon.name: "state-warning"
            type: Kirigami.Badge.Type.Warning
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Large symbolic re-colored icon:")
            icon.name: "weather-freezing-scattered-rain-storm-day-symbolic"
            icon.width: Kirigami.Units.iconSizes.large
            icon.height: Kirigami.Units.iconSizes.large
            icon.color: "gray"
            type: Kirigami.Badge.Type.Error
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Non-symbolic icon:")
            icon.name: "kde"
        }
    }
}

