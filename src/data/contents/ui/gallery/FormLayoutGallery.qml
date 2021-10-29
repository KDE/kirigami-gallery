

import QtQuick 2.15
import QtQuick.Controls 2.15 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kirigami 2.15 as Kirigami

Kirigami.ScrollablePage {
    id: page

    title: "Form Layout"

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
            QQC2.TextField {
                Kirigami.FormData.label: "Checkable label"
                Kirigami.FormData.checkable: true
                enabled: Kirigami.FormData.checked
            }
            ColumnLayout {
                Layout.rowSpan: 3
                Kirigami.FormData.label: "Label for radios:"
                Kirigami.FormData.buddyFor: thirdRadio//firstRadio
                QQC2.RadioButton {
                    id: firstRadio
                    checked: true
                    text: "One"
                }
                QQC2.RadioButton {
                    text: "Two"
                }
                QQC2.RadioButton {
                    id: thirdRadio
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
