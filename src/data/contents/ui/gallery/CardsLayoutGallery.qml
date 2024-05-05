/*
 *   Copyright 2018 Marco Martin <mart@kde.org>
 *   Copyright 2024 ivan tkachenko <me@ratijas.tk>
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
import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    title: qsTr("Cards Layout")

    actions: KGC.InfoSheetAction {
        page: page
        component: "CardsLayoutGallery"
    }

    ColumnLayout {
        Kirigami.CardsLayout {
            id: layout
            Kirigami.AbstractCard {
                Layout.fillHeight: true
                header: Kirigami.Heading {
                    text: qsTr("AbstractCard")
                    level: 2
                }
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    text: qsTr("An AbstractCard is the simplest form of card. It's just a rectangle with a shadow, which can contain any Item in it. It can also have items assigned to the Header or Footer properties. In this case a Kirigami.Heading is its header and a Label with WordWrap is the contentItem.")
                }
            }

            Kirigami.AbstractCard {
                showClickFeedback: true
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    text: qsTr("This is an AbstractCard with a Label with WordWrap in it and nothing else, it's the simplest form Cards can be found in.\nAn AbstractCard can be clicked itself, with the usual onClicked signal handler and the showClickFeedback property can be used if the click should show any kind of visual feedback. It is recommended to set it to true if you plan to make the card reactive on any kind of click.")
                }
                onClicked: showPassiveNotification(qsTr("Card clicked"))
            }

            Kirigami.Card {
                actions: [
                    Kirigami.Action {
                        text: qsTr("Action1")
                        icon.name: "add-placemark"
                    },
                    Kirigami.Action {
                        text: qsTr("Action2")
                        icon.name: "address-book-new-symbolic"
                    }
                ]
                banner {
                    source: Qt.resolvedUrl("../banner.jpg")
                    title: qsTr("Card")
                }
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    text: qsTr("This is an instance of the Card type: it can optionally have an image, a title and an icon assigned to its banner group property, one or all of the properties together. A Card can also have Actions that will appear in the footer.")
                }
            }


            Kirigami.Card {
                actions: [
                    Kirigami.Action {
                        text: qsTr("Action1")
                        icon.name: "add-placemark"
                    },
                    Kirigami.Action {
                        text: qsTr("Action2")
                        icon.name: "address-book-new-symbolic"
                    },
                    Kirigami.Action {
                        text: qsTr("Action3")
                        icon.name: "add-placemark"
                    },
                    Kirigami.Action {
                        text: qsTr("Action4")
                        icon.name: "address-book-new-symbolic"
                    },
                    Kirigami.Action {
                        text: qsTr("Action5")
                        icon.name: "add-placemark"
                    },
                    Kirigami.Action {
                        text: qsTr("Action6")
                        icon.name: "address-book-new-symbolic"
                    }
                ]
                banner {
                    source: Qt.resolvedUrl("../banner.jpg")
                    title: "Title Alignment"
                    titleAlignment: Qt.AlignLeft | Qt.AlignBottom
                }
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    text: qsTr("The title can be aligned to all corners or centered with a combination of Qt.Alignment flags.\n When there are too many actions, they go in an overflow menu.")
                }
            }

            Kirigami.Card {
                actions: [
                    Kirigami.Action {
                        text: qsTr("Action1")
                        icon.name: "add-placemark"
                    },
                    Kirigami.Action {
                        text: qsTr("Action2")
                        icon.name: "address-book-new-symbolic"
                    },
                    Kirigami.Action {
                        text: qsTr("Action always hidden")
                        icon.name: "add-placemark"
                        displayHint: Kirigami.DisplayHint.AlwaysHide
                    }
                ]
                banner {
                    titleIcon: "applications-graphics"
                    title: "Title only"
                }
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    text: qsTr("The Banner can contain only the title and/or an icon, even if there is no banner image.")
                }
            }

            Kirigami.Card {
                banner.source: Qt.resolvedUrl("../banner.jpg")

                header: Rectangle {
                    color: Qt.rgba(0,0,0,0.3)
                    implicitWidth: headerLayout.implicitWidth
                    implicitHeight: headerLayout.implicitHeight - avatarIcon.height/2
                    ColumnLayout {
                        id: headerLayout
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        QQC2.Label {
                            Layout.fillWidth: true
                            padding: Kirigami.Units.largeSpacing

                            color: "white"
                            wrapMode: Text.WordWrap
                            text: qsTr("It's possible to have custom contents overlapping the image, for cases where a more personalized design is needed.")
                        }
                        Rectangle {
                            id: avatarIcon
                            color: "steelblue"
                            radius: width
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                            Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                        }
                    }
                }
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    topPadding: avatarIcon.height/2
                    text: qsTr("It's possible to customize the look and feel for Cards too, if the no padding behavior for headers is needed. This is usually discouraged in order to have greater consistency, but in some cases the design requires a more fancy layout, as shown in this example of a Card. If a custom header is used, the title and icon in the banner property shouldn't be used. If a custom footer is used (which is discouraged), actions shouldn't be used.")
                }
                footer: RowLayout {
                    QQC2.Label {
                        Layout.fillWidth: true
                        text: qsTr("Custom footer")
                    }
                    QQC2.Button {
                        text: qsTr("Ok")
                    }
                }
            }

            Kirigami.Card {
                headerOrientation: Qt.Horizontal
                actions: [
                    Kirigami.Action {
                        text: qsTr("Action1")
                        icon.name: "add-placemark"
                    },
                    Kirigami.Action {
                        text: qsTr("Action2")
                        icon.name: "address-book-new-symbolic"
                    }
                ]
                banner {
                    source: Qt.resolvedUrl("../banner.jpg")
                    title: "Title"
                }
                contentItem: QQC2.Label {
                    wrapMode: Text.WordWrap
                    text: qsTr("A card can optionally have horizontal orientation.\n In this case will be wider than tall, so is fit to be used also in a ColumnLayout.\nIf you need to put it in a CardsLayout, it will have by default a columnSpan of 2 (which can be overridden).")
                }
            }
        }
    }
}
