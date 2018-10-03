/*
 *   Copyright 2018 Marco Martin <mart@kde.org>
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

import QtQuick 2.0
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

import "components"

Kirigami.ScrollablePage {
    id: page
    Layout.fillWidth: true
    //implicitWidth: Units.gridUnit * (Math.floor(Math.random() * 35) + 10)

    title: qsTr("Overlay Sheets")

    actions.main: Kirigami.Action {
        iconName: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.sheetOpen = checked;
        shortcut: "Alt+I"
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.sheetOpen) {
            event.accepted = true;
            sheet.close();
        }
    }

    InfoSheet {
        id: sheet
        title: qsTr("Overlay Sheets")
        sourceUrl: "https://cgit.kde.org/kirigami.git/tree/examples/gallerydata/contents/ui/gallery/OverlaySheetGallery.qml"
        text: qsTr("The OverlaySheet control is a kind of modal content which goes over the main application content (either just the page or the whole app area) which is supposed to be used to display long contents, which may be taller than the application window itself, in which case the content will be scrollable.\nThe visual metaphore of the control is a piece of paper that scrolling, covering the page of the application, which can be dismissed scrolling it away (or tapping any area outside it).")
    }

    Kirigami.OverlaySheet {
        id: longSheet
        ColumnLayout {
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis."
            }

            Controls.TextField {
                Layout.alignment: Qt.AlignHCenter
            }

            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "
    Morbi dictum, sapien at maximus pulvinar, sapien metus condimentum magna, quis lobortis nisi dui mollis turpis. Aliquam sit amet scelerisque dui. In sit amet tellus placerat, condimentum enim sed, hendrerit quam. Integer dapibus lobortis finibus. Suspendisse faucibus eros vitae ante posuere blandit. Nullam volutpat quam id diam hendrerit aliquam. Donec non sem at diam posuere convallis. Vivamus ut congue quam. Ut dictum fermentum sapien, eu ultricies est ornare ut.

    Nullam fringilla a libero vehicula faucibus. Donec euismod sodales nulla, in vehicula lectus posuere a. Donec nisi nulla, pulvinar eu porttitor vitae, varius eget ante. Nam rutrum eleifend elit, quis facilisis leo sodales vitae. Aenean accumsan a nulla at sagittis. Integer placerat tristique magna, vitae iaculis ante cursus sit amet. Sed facilisis mollis turpis nec tristique. Etiam quis feugiat odio. Vivamus sagittis at purus nec aliquam.

    Morbi neque dolor, elementum ac fermentum ac, auctor ut erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus non nibh sit amet quam luctus congue. Donec in eros varius, porta metus sed, sagittis lacus. Mauris dapibus lorem nisi, non eleifend massa tristique egestas. Curabitur nec blandit urna. Mauris rhoncus libero felis, commodo viverra ante consectetur vel. Donec dictum tincidunt orci, quis tristique urna. Quisque egestas, dui ac mollis dictum, purus velit elementum est, at pellentesque erat est fermentum purus. Nulla a quam tellus. Vestibulum a congue ligula. Quisque feugiat nulla et tortor sodales viverra. Maecenas dolor leo, elementum sed urna vel, posuere hendrerit metus. Mauris pellentesque, mi non luctus aliquam, leo nulla varius arcu, vel pulvinar enim enim nec nisl.

    Etiam sapien leo, venenatis eget justo at, pellentesque mollis tellus. Fusce consequat ullamcorper vulputate. Duis tellus nisi, dictum ut augue non, elementum congue ligula. Fusce in vehicula arcu. Nulla facilisi. Quisque a convallis sapien. Aenean pellentesque convallis egestas. Phasellus rhoncus, nulla in tempor maximus, arcu ex venenatis diam, sit amet egestas mi dolor non ante. "
            }
            Controls.Button {
                text: qsTr("Close")
                Layout.alignment: Qt.AlignHCenter
                onClicked: sheet.close()
            }
        }
    }

    Kirigami.OverlaySheet {
        id: headerFooterSheet
        header: Kirigami.Heading {
            text: qsTr("Title")
        }
        footer: RowLayout {
            Controls.Label {
                text: qsTr("Footer:")
            }
            Controls.TextField {
                Layout.fillWidth: true
            }
        }
        ColumnLayout {
            spacing: Kirigami.Units.largeSpacing * 5
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A sheet can have optional header and footer items which will not scroll away when the sheet overflows.")
            }
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis.\nMorbi dictum, sapien at maximus pulvinar, sapien metus condimentum magna, quis lobortis nisi dui mollis turpis. Aliquam sit amet scelerisque dui. In sit amet tellus placerat, condimentum enim sed, hendrerit quam. Integer dapibus lobortis finibus. Suspendisse faucibus eros vitae ante posuere blandit. Nullam volutpat quam id diam hendrerit aliquam. Donec non sem at diam posuere convallis. Vivamus ut congue quam. Ut dictum fermentum sapien, eu ultricies est ornare ut.\nNullam fringilla a libero vehicula faucibus. Donec euismod sodales nulla, in vehicula lectus posuere a. Donec nisi nulla, pulvinar eu porttitor vitae, varius eget ante. Nam rutrum eleifend elit, quis facilisis leo sodales vitae. Aenean accumsan a nulla at sagittis. Integer placerat tristique magna, vitae iaculis ante cursus sit amet. Sed facilisis mollis turpis nec tristique. Etiam quis feugiat odio. Vivamus sagittis at purus nec aliquam.\nMorbi neque dolor, elementum ac fermentum ac, auctor ut erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus non nibh sit amet quam luctus congue. Donec in eros varius, porta metus sed, sagittis lacus. Mauris dapibus lorem nisi, non eleifend massa tristique egestas. Curabitur nec blandit urna. Mauris rhoncus libero felis, commodo viverra ante consectetur vel. Donec dictum tincidunt orci, quis tristique urna. Quisque egestas, dui ac mollis dictum, purus velit elementum est, at pellentesque erat est fermentum purus. Nulla a quam tellus. Vestibulum a congue ligula. Quisque feugiat nulla et tortor sodales viverra. Maecenas dolor leo, elementum sed urna vel, posuere hendrerit metus. Mauris pellentesque, mi non luctus aliquam, leo nulla varius arcu, vel pulvinar enim enim nec nisl.\nEtiam sapien leo, venenatis eget justo at, pellentesque mollis tellus. Fusce consequat ullamcorper vulputate. Duis tellus nisi, dictum ut augue non, elementum congue ligula. Fusce in vehicula arcu. Nulla facilisi. Quisque a convallis sapien. Aenean pellentesque convallis egestas. Phasellus rhoncus, nulla in tempor maximus, arcu ex venenatis diam, sit amet egestas mi dolor non ante."
            }
        }
    }

    Kirigami.OverlaySheet {
        id: fixedWidthSheet

        ColumnLayout {
            spacing: Kirigami.Units.largeSpacing * 5
            Layout.preferredWidth:  Kirigami.Units.gridUnit * 25
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A sheet will take the maximum available width in the page by default.\nHowever, if the main item sets an implicitWidth or Layout.preferredWidth, the sheet won't grow in width more than such given value.")
            }
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis."
            }
        }
    }
    
    Kirigami.OverlaySheet {
        id: globalSheet

        parent: applicationWindow().overlay

        ColumnLayout {
            spacing: Kirigami.Units.largeSpacing * 5
            Layout.preferredWidth:  Kirigami.Units.gridUnit * 25
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: qsTr("A sheet by default will be over a single page, even if the app is in wide mode. By changing the sheet parent to applicationWindow().overlay it will display the sheet as an overlay on top of the whole application window.\nIn this case the sheet will cover the page Action buttons too.")
            }
            Controls.Label {
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum. Morbi commodo auctor varius. Donec molestie euismod ultrices. Sed facilisis augue nec eros auctor, vitae mattis quam rhoncus. Nam ut erat diam. Curabitur iaculis accumsan magna, eget fermentum massa scelerisque eu. Cras elementum erat non erat euismod accumsan. Vestibulum ac mi sed dui finibus pulvinar. Vivamus dictum, leo sed lobortis porttitor, nisl magna faucibus orci, sit amet euismod arcu elit eget est. Duis et vehicula nibh. In arcu sapien, laoreet sit amet porttitor non, rhoncus vel magna. Suspendisse imperdiet consectetur est nec ornare. Pellentesque bibendum sapien at erat efficitur vehicula. Morbi sed porta nibh. Vestibulum ut urna ut dolor sagittis mattis."
            }
        }
    }

     Kirigami.OverlaySheet {
        id: listViewSheet
        header: Kirigami.Heading {
            text: qsTr("Title")
        }
        footer: RowLayout {
            Controls.Label {
                text: qsTr("Footer:")
            }
            Controls.TextField {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignCenter
            }
        }
        ListView {
            model: 100
            implicitWidth: Kirigami.Units.gridUnit * 30
            delegate: Kirigami.BasicListItem {
                label: qsTr("Item in sheet ") + modelData
            }
        }
    }

    ColumnLayout {
        width: page.width
        spacing: Kirigami.Units.smallSpacing

        Controls.Button {
            text: qsTr("Very Long Sheet")
            Layout.alignment: Qt.AlignHCenter
            onClicked: longSheet.open()
        }
        Controls.Button {
            text: "Sheet With Header And Footer"
            Layout.alignment: Qt.AlignHCenter
            onClicked: headerFooterSheet.open()
        }
        Controls.Button {
            text: "Sheet With Fixed Width"
            Layout.alignment: Qt.AlignHCenter
            onClicked: fixedWidthSheet.open()
        }
        Controls.Button {
            text: "Global Sheet"
            Layout.alignment: Qt.AlignHCenter
            onClicked: globalSheet.open()
        }
        Controls.Button {
            text: "Sheet With List View"
            Layout.alignment: Qt.AlignHCenter
            onClicked: listViewSheet.open()
        }
    }
}
