/*
 *  SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
 *  SPDX-FileCopyrightText: 2023 ivan tkachenko <me@ratijas.tk>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    implicitWidth: Window.width
    title: "Text fields"

    actions: KGC.InfoSheetAction {
        page: page
        component: "TextFieldGallery"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: Kirigami.Units.largeSpacing

        Kirigami.FormLayout {
            Layout.fillWidth: true

            QQC2.TextField {
                placeholderText: "Search…"
                Kirigami.FormData.label: "Placeholder text:"
            }
            QQC2.TextField {
                text: "Read-only"
                readOnly: true
                Kirigami.FormData.label: "Read-only:"
            }
            QQC2.TextField {
                text: "Disabled"
                enabled: false
                Kirigami.FormData.label: "Disabled field:"
            }
            Kirigami.PasswordField {
                Kirigami.FormData.label: "Password:"
            }
            Kirigami.SearchField {
                Kirigami.FormData.label: "Search:"
            }

            QQC2.TextField {
                inputMask: "99999999"
                inputMethodHints: Qt.ImhDigitsOnly
                Kirigami.FormData.label: "Numbers:"
            }

            Kirigami.Separator {
                Kirigami.FormData.label: "Text area"
                Kirigami.FormData.isSection: true
            }

            QQC2.CheckBox {
                id: spellcheckCheckBox
                text: "Spell Check"
                checked: field.Kirigami.SpellCheck.enabled
                onToggled: {
                    field.Kirigami.SpellCheck.enabled = checked;
                }
            }
        }

        QQC2.TextArea {
            id: field
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: Kirigami.Units.gridUnit * 12
            Layout.minimumHeight: Kirigami.Units.gridUnit * 12
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu nisl ac nibh malesuada pretium ut sit amet libero. Nulla libero arcu, pharetra a dignissim nec, iaculis sit amet metus. Suspendisse quis justo efficitur, pharetra dui maximus, aliquam dolor. Vestibulum vel imperdiet turpis. Mauris ut leo mauris. Praesent ut libero sollicitudin, tincidunt nisi a, efficitur erat. Curabitur lacinia leo et tempor aliquam."
            wrapMode: TextEdit.Wrap
        }
    }
}
