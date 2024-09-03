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

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.Page {
    id: page
    Layout.fillWidth: true
    title: "Simple Page"

    actions: [
        KGC.InfoSheetAction {
            page: page
            component: "NonScrollableGallery"
        },
        Kirigami.Action {
            icon.name: sheet.opened ? "dialog-cancel-symbolic" : "document-edit-symbolic"
            text: "Main Action Text"
            checkable: true
            checked: sheet.opened
            onTriggered: sheet.open();
        }
    ]

    header: QQC2.Button {
        text: "bah"
    }
    footer: QQC2.Button {
        text: "buh"
    }
    Rectangle {
        anchors.fill: parent
        color: Kirigami.Theme.positiveBackgroundColor
        QQC2.Label {
            anchors.centerIn: parent
            text: "Rectangle with automatic margins"
        }
    }

    Kirigami.OverlaySheet {
        id: sheet
        parent: page.QQC2.Overlay.overlay
        QQC2.Label {
            property int implicitWidth: Kirigami.Units.gridUnit * 30
            wrapMode: Text.WordWrap
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis."
        }
    }
}
