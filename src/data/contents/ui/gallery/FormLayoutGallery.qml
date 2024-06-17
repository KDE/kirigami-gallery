/*
 *  SPDX-FileCopyrightText: 2018 Marco Martin <mart@kde.org>
 *  SPDX-FileCopyrightText: 2024 ivan tkachenko <me@ratijas.tk>
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

    title: "Form Layout"

    actions: KGC.InfoSheetAction {
        page: page
        component: "FormLayoutGallery"
    }

    ColumnLayout {

        Kirigami.FormLayout {
            id: layout
            Layout.fillWidth: true

            twinFormLayouts: layout2
            QQC2.TextField {
                Kirigami.FormData.label: "Label:"
            }
            QQC2.TextField {
            }
            QQC2.TextField {
                Kirigami.FormData.label:"Lo&nger label:"
            }
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
            }
            QQC2.TextField {
                Kirigami.FormData.label: "After separator:"
            }
            QQC2.ComboBox {
                Kirigami.FormData.label: "Combo:"
                model: ["First", "Second", "Third"]
            }
            QQC2.CheckBox {
                checked: true
                text: "Option"
            }
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Section title"
            }
            QQC2.TextField {
                Kirigami.FormData.label: "Label:"
            }
            Item {
                Kirigami.FormData.isSection: true
            }
            QQC2.TextField {
                Kirigami.FormData.label: "Section without line:"
            }
            QQC2.Button {
                text: qsTr("Expanding Button")
                Layout.fillWidth: true
            }
            Item {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Section with title without line"
            }
            QQC2.TextField {
                Kirigami.FormData.label: "Title:"
            }
            ColumnLayout {
                Layout.rowSpan: 3
                Kirigami.FormData.label: "Label for radios:"
                Kirigami.FormData.buddyFor: firstRadio
                QQC2.RadioButton {
                    id: firstRadio
                    checked: true
                    text: "One"
                }
                QQC2.RadioButton {
                    text: "Two"
                }
                QQC2.RadioButton {
                    text: "Three"
                }
            }
            QQC2.Button {
                text: item ? "Remove Field" : "Add Field"
                property QQC2.TextField item
                onClicked: {
                    if (item) {
                        item.destroy();
                    } else {
                        item = dyncomponent.createObject(layout);
                    }
                }
                Component {
                    id: dyncomponent
                    QQC2.TextField {
                        Kirigami.FormData.label: "Generated Title:"
                    }
                }
            }
        }
        Kirigami.FormLayout {
            id: layout2
            Layout.fillWidth: true
            twinFormLayouts: layout
            QQC2.TextField {
                Kirigami.FormData.label: qsTr("Twin Layout:")
            }
        }
    }
}
