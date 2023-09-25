

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import org.kde.kirigami as Kirigami
import "components" as KGC

Kirigami.ScrollablePage {
    id: page
    title: "Form Layout"

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
        component: "FormLayoutGallery"
    }

    ColumnLayout {
        spacing: Kirigami.Units.smallSpacing

        Kirigami.FormLayout {
            id: layout
            Layout.fillWidth: true

            twinFormLayouts: layout2
            TextField {
                Kirigami.FormData.label: "Label:"
            }
            TextField {
            }
            TextField {
                Kirigami.FormData.label:"Lo&nger label:"
            }
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
            }
            TextField {
                Kirigami.FormData.label: "After separator:"
            }
            ComboBox {
                Kirigami.FormData.label: "Combo:"
                model: ["First", "Second", "Third"]
            }
            CheckBox {
                checked: true
                text: "Option"
            }
            Kirigami.Separator {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Section title"
            }
            TextField {
                Kirigami.FormData.label: "Label:"
            }
            Item {
                Kirigami.FormData.isSection: true
            }
            TextField {
                Kirigami.FormData.label: "Section without line:"
            }
            Button {
                text: qsTr("Expanding Button")
                Layout.fillWidth: true
            }
            Item {
                Kirigami.FormData.isSection: true
                Kirigami.FormData.label: "Section with title without line"
            }
            TextField {
                Kirigami.FormData.label: "Title:"
            }
            ColumnLayout {
                Layout.rowSpan: 3
                Kirigami.FormData.label: "Label for radios:"
                Kirigami.FormData.buddyFor: thirdRadio//firstRadio
                RadioButton {
                    id: firstRadio
                    checked: true
                    text: "One"
                }
                RadioButton {
                    text: "Two"
                }
                RadioButton {
                    id: thirdRadio
                    text: "Three"
                }
            }
            Button {
                text: item ? "Remove Field" : "Add Field"
                property TextField item
                onClicked: {
                    if (item) {
                        item.destroy();
                    } else {
                        item = dyncomponent.createObject(layout);
                    }
                }
                Component {
                    id: dyncomponent
                    TextField {
                        Kirigami.FormData.label: "Generated Title:"
                    }
                }
            }
        }
        Kirigami.FormLayout {
            id: layout2
            Layout.fillWidth: true
            twinFormLayouts: layout
            TextField {
                Kirigami.FormData.label: qsTr("Twin Layout:")
            }
        }
    }
}
