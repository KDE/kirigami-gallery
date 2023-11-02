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

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    title: qsTr("Grid view of Cards")

    actions: Kirigami.Action {
        icon.name: "documentinfo"
        text: qsTr("Info")
        checkable: true
        onCheckedChanged: sheet.visible = checked;
        shortcut: "Alt+I"
    }

    //Close the drawer with the back button
    onBackRequested: {
        if (sheet.visible) {
            event.accepted = true;
            sheet.close();
        }
    }

    KGC.InfoSheet {
        id: sheet

        page: page
        component: "CardsGridViewGallery"
    }

    Component.onCompleted: {
        for (var i = 0; i < 50; ++i) {
            mainModel.append({"title": "Item " + i,
                "image": Qt.resolvedUrl("../banner.jpg"),
                "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum.",
                "actions": [{text: "Action 1", icon: "add-placemark"},
                            {text: "Action 2", icon: "address-book-new-symbolic"}]
            })
        }
    }
    KGC.CardsGridView {
        model: ListModel {
            id: mainModel
        }
        delegate: Kirigami.Card {
            width: GridView.view.cardWidth
            height: GridView.view.cardHeight

            banner {
                title: model.title
                source: model.image
            }
            contentItem: QQC2.Label {
                wrapMode: Text.WordWrap
                text: model.text
                elide: Text.ElideRight
            }
            actions: [
                Kirigami.Action {
                    text: model.actions.get(0).text
                    icon.name: model.actions.get(0).icon
                    onTriggered: print(model.actions)
                },
                Kirigami.Action {
                    text: model.actions.get(1).text
                    icon.name: model.actions.get(1).icon
                    onTriggered: print(model.actions)
                }
            ]
        }
    }
}
