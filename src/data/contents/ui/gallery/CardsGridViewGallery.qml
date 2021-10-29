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

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.15 as Kirigami

Kirigami.ScrollablePage {
    id: page

    title: qsTr("Grid view of Cards")

    actions.main:  Kirigami.Action {
        text: qsTr("Info")
        iconName: "documentinfo"
        checkable: true
        onCheckedChanged: sheet.sheetOpen = checked;
        shortcut: "Alt+I"
    }

    InfoSheet {
        id: sheet
        page: page
        component: "CardsGridViewGallery"
    }

    Component.onCompleted: {
        for (var i = 0; i < 50; ++i) {
            mainModel.append({"title": "Item " + i,
                "image": "qrc:/banner.jpg",
                "text": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id risus id augue euismod accumsan. Nunc vestibulum placerat bibendum.",
                "actions": [{text: "Action 1", icon: "add-placemark"},
                            {text: "Action 2", icon: "address-book-new-symbolic"}]
            })
        }
    }
    Kirigami.CardsGridView {
        id: view
        model: ListModel {
            id: mainModel
        }

//property Component delegate
        delegate:Kirigami.Card {
            id: card
            banner {
                title: model.title
                source: model.image
            }
            contentItem: QQC2.Label {
                wrapMode: Text.WordWrap
                text: model.text
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
