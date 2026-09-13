/*
 *  SPDX-FileCopyrightText: 2018 Marco Martin <mart@kde.org>
 *  SPDX-FileCopyrightText: 2024 ivan tkachenko <me@ratijas.tk>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kirigami.forms as KF
import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    title: "Form Layout"

    actions: KGC.InfoSheetAction {
        page: page
        component: "FormLayoutGallery"
    }

    KF.Form {
        KF.FormGroup {
            KF.FormEntry {
                title: "Label:"
                contentItem: QQC2.TextField {}
            }
            KF.FormEntry {
                contentItem: QQC2.TextField {}
            }
            KF.FormEntry {
                title: "Lo&nger label:"
                contentItem: QQC2.TextField {}
            }
            KF.FormSeparator {}
            KF.FormEntry {
                title: "After separator:"
                contentItem: QQC2.TextField {}
            }
            KF.FormEntry {
                title: "Combo:"
                contentItem: QQC2.ComboBox {
                    model: ["First", "Second", "Third"]
                }
            }
            KF.FormEntry {
                contentItem: QQC2.CheckBox {
                    checked: true
                    text: "Option"
                }
            }
        }
        KF.FormGroup {
            title: "Section title"
            KF.FormEntry {
                title: "Label:"
                contentItem: QQC2.TextField {}
            }
            KF.FormEntry {
                title: "Section without line:"
                contentItem: QQC2.TextField {}
            }
            KF.FormEntry {
                id: buttonEntry
                contentItem: QQC2.Button {
                    Layout.fillWidth: true
                    text: qsTr("Expanding Button")
                }
            }
        }
        KF.FormGroup {
            title: "Section title"
            QQC2.ButtonGroup {
                buttons: [radio1, radio2, radio3]
            }
            KF.FormEntry {
                title: "Label for radios:"
                contentItem: QQC2.RadioButton {
                    id: radio1
                    checked: true
                    text: "One"
                }
            }
            KF.FormEntry {
                contentItem: QQC2.RadioButton {
                    id: radio2
                    text: "Two"
                }
            }
            KF.FormEntry {
                contentItem: QQC2.RadioButton {
                    id: radio3
                    text: "Three"
                }
            }
            KF.FormEntry {
                title: "Label for radios:"
                contentItem: QQC2.Button {
                    text: hiddenField.visible ? "Remove Field" : "Add Field"
                    onClicked: hiddenField.visible = !hiddenField.visible
                }
            }
            KF.FormEntry {
                id: hiddenField
                title: "Generated Title:"
                visible: false
                contentItem: QQC2.TextField {}
            }
        }
    }
}
