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

import QtQuick 2.6
import QtQuick.Controls 2.0 as QQC2
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.4 as Kirigami

import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    title: qsTr("List view of simple cards")

    actions: Kirigami.Action {
        icon.name: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.visible = checked;
        shortcut: "Alt+I"
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.opened) {
            event.accepted = true;
            sheet.close();
        }
    }

    KGC.InfoSheet {
        id: sheet

        page: page
        component: "CardsListViewGallery"
    }

    Kirigami.CardsListView {
        id: view
        model: 100

        delegate: Kirigami.AbstractCard {
            //NOTE: never put a Layout as contentItem as it will cause binding loops
            //SEE: https://bugreports.qt.io/browse/QTBUG-66826
            contentItem: Item {
                implicitWidth: delegateLayout.implicitWidth
                implicitHeight: delegateLayout.implicitHeight
                GridLayout {
                    id: delegateLayout
                    anchors {
                        left: parent.left
                        top: parent.top
                        right: parent.right
                        //IMPORTANT: never put the bottom margin
                    }
                    rowSpacing: Kirigami.Units.largeSpacing
                    columnSpacing: Kirigami.Units.largeSpacing
                    columns: width > Kirigami.Units.gridUnit * 20 ? 4 : 2
                    Kirigami.Icon {
                        source: "applications-graphics"
                        Layout.fillHeight: true
                        Layout.maximumHeight: Kirigami.Units.iconSizes.huge
                        Layout.preferredWidth: height
                    }
                    ColumnLayout {
                        Kirigami.Heading {
                            level: 2
                            text: qsTr("Product ")+ modelData
                        }
                        Kirigami.Separator {
                            Layout.fillWidth: true
                        }
                        QQC2.Label {
                            Layout.fillWidth: true
                            wrapMode: Text.WordWrap
                            text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan.")
                        }
                    }
                    QQC2.Button {
                        Layout.alignment: Qt.AlignRight|Qt.AlignVCenter
                        Layout.columnSpan: 2 
                        text: qsTr("Install")
                        onClicked: showPassiveNotification("Install for Product " + modelData + " clicked");
                    }
                }
            }
        }
    }
}
