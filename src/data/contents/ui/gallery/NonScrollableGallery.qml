// SPDX-FileCopyrightText: 2015 Marco Martin <mart@kde.org>
// SPDX-FileCopyrightText: 2023 Carl Schwan <carl@carlschwan.eu>
// SPDX-License-Identifier: LGPL-2.0-or-later

import QtQuick 2
import QtQuick.Controls 2 as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Kirigami.Page {
    id: page

    title: "Simple Page"

    actions: Kirigami.Action {
        icon.name: sheet.visible ? "dialog-cancel" : "document-edit"
        text: "Main Action Text"
        checkable: true
        onCheckedChanged: sheet.visible = checked;
    }

    header: QQC2.Button {
        text: "bah"
    }

    footer: QQC2.Button {
        text: "buh"
    }

    Rectangle {
        anchors.fill: parent
        color: "red"

        QQC2.Label {
            anchors.centerIn: parent
            text: "Rectangle with automatic margins"
        }
    }

    Kirigami.OverlaySheet {
        id: sheet
        onVisibleChanged: page.actions[0].checked = visible;

        QQC2.Label {
            property int implicitWidth: Units.gridUnit * 30
            wrapMode: Text.WordWrap
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis."
        }
    }
}
