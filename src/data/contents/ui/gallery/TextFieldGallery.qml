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
import org.kde.kirigami 2.20 as Kirigami

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    implicitWidth: applicationWindow().width
    title: "Text fields"

    ColumnLayout {
        Kirigami.FormLayout {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true

            width: page.width

            QQC2.TextField {
                placeholderText: "Search..."
                Kirigami.FormData.label: "Placeholder text:"
            }
            QQC2.TextField {
                text: "Disabled"
                enabled: false
                Kirigami.FormData.label: "Disabled field:"
            }
            QQC2.TextField {
                echoMode: TextInput.Password
                Kirigami.FormData.label: "Password:"
            }

            QQC2.TextField {
                inputMask: "99999999"
                inputMethodHints: Qt.ImhDigitsOnly
                Kirigami.FormData.label: "Numbers:"
            }
        }

        QQC2.Label {
            text: "Text area:"
        }

        QQC2.TextArea {
            id: field
            Layout.fillWidth: true
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent eu nisl ac nibh malesuada pretium ut sit amet libero. Nulla libero arcu, pharetra a dignissim nec, iaculis sit amet metus. Suspendisse quis justo efficitur, pharetra dui maximus, aliquam dolor. Vestibulum vel imperdiet turpis. Mauris ut leo mauris. Praesent ut libero sollicitudin, tincidunt nisi a, efficitur erat. Curabitur lacinia leo et tempor aliquam."
            Layout.minimumWidth: Kirigami.Units.gridUnit * 12
            Layout.minimumHeight: Kirigami.Units.gridUnit * 12
            wrapMode: QQC2.TextArea.WordWrap
        }
    }
}
