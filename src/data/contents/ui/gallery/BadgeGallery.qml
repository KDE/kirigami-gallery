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
            type: Kirigami.BadgeType.Error
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
            type: Kirigami.BadgeType.Positive
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label, warning:")
            icon.name: "unlock-symbolic"
            text: qsTr("Unencrypted")
            type: Kirigami.BadgeType.Warning
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + label with all custom colors:")
            icon.name: "favorite-favorited-symbolic"
            text: qsTr("Favorite")
            backgroundColor: Kirigami.Theme.visitedLinkColor
            textColor: Kirigami.Theme.highlightedTextColor
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Super compact version with all custom colors:")
            text: qsTr("Integrated GPU")
            padding: 0
            backgroundColor: "teal"
            textColor: "white"
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Awkwardly long string, bounded length:")
            Layout.maximumWidth: 150
            text: qsTr("Your computer is about to explode; please calmly proceed to the nearest exit")
            type: Kirigami.BadgeType.Error
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Icon + awkwardly long string, bounded length:")
            Layout.maximumWidth: 150
            icon.name: "edit-bomb-symbolic"
            text: qsTr("Your computer is about to explode; please calmly proceed to the nearest exit")
            type: Kirigami.BadgeType.Error
        }

        Item {
            Kirigami.FormData.label: "Icons-only badges"
            Kirigami.FormData.isSection: true
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Symbolic icon:")
            icon.name: "edit-bomb-symbolic"
            type: Kirigami.BadgeType.Error
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Large symbolic icon:")
            icon.name: "edit-bomb-symbolic"
            icon.width: Kirigami.Units.iconSizes.large
            icon.height: Kirigami.Units.iconSizes.large
            type: Kirigami.BadgeType.Error
        }
        Kirigami.Badge {
            Kirigami.FormData.label: qsTr("Non-symbolic icon:")
            icon.name: "kde"
        }
    }
}

