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

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.coreaddons as Core
import "components" as KGC

Kirigami.ScrollablePage {
    id: page

    title: qsTr("About Kirigami Gallery")

    actions: KGC.InfoSheetAction {
        page: page
        component: "AboutPage"
    }

    Kirigami.AboutPage {
        aboutData: Core.AboutData
    }
}
