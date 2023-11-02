/*
 *  SPDX-FileCopyrightText: 2018 Marco Martin <mart@kde.org>
 *  SPDX-FileCopyrightText: 2023 Matej Starc <matej.starc@protonmail.com>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import org.kde.kirigami as Kirigami

GridView {
    id: root

//BEGIN PROPERTIES

    /**
     * @brief This property sets whether the view should fill the first row with columns
     * even when there is not enough space.
     *
     * Set this to true if you want to stop the view from filling the first row with columns,
     * even when delegates can't even fill the first row.
     *
     * default: ``true``
     */
    property bool extraColumns: true

    /**
     * @brief This property holds the number of columns the gridview has.
     * @since 2.5
     */
    readonly property int columns: {
        const minColumnWidth = minimumCardWidth + horizontalSpacing
        const maxColumnWidth = maximumCardWidth + horizontalSpacing

        const minFromWidth = Math.floor(width / minColumnWidth)
        const maxFromWidth = Math.ceil(width / maxColumnWidth)

        return Math.max(1, Math.min(minFromWidth, maxFromWidth))
    }

    property int horizontalSpacing: Kirigami.Units.largeSpacing
    property int verticalSpacing: Kirigami.Units.largeSpacing

    property int maximumCardWidth: Kirigami.Units.gridUnit * 18
    property int minimumCardWidth: Kirigami.Units.gridUnit * 12

    property int maximumCardHeight: Kirigami.Units.gridUnit * 16
    property int minimumCardHeight: Kirigami.Units.gridUnit * 12


    property real cardHeightRatio: 1.3

    readonly property int cardWidth: Math.max(minimumCardWidth, Math.min(Math.floor((width - columns * horizontalSpacing) / columns), maximumCardWidth))
    readonly property int cardHeight: Math.max(minimumCardHeight, Math.min(cardWidth * cardHeightRatio, maximumCardHeight))
//END PROPERTIES

    cellWidth: cardWidth + horizontalSpacing
    cellHeight: cardHeight + verticalSpacing

    topMargin: Kirigami.Units.largeSpacing * 2

    Keys.onPressed: event => {
        if (event.key === Qt.Key_Home) {
            positionViewAtBeginning();
            currentIndex = 0;
            event.accepted = true;
        }
        else if (event.key === Qt.Key_End) {
            positionViewAtEnd();
            currentIndex = count - 1;
            event.accepted = true;
        }
    }
}
