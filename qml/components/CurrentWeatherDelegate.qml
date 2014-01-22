import QtQuick 2.0
import Sailfish.Silica 1.0

BackgroundItem {
    id: currentWeatherDelegate
    property var label: [
        "2 metrin lämpötila",
        "10 min tuulennopeus",
        "10 min puuskat",
        "10 min tuulensuunta",
        "suhteellinen kosteus",
        "kastepistelämpötila",
        "tunnin sademäärä",
        "10 min sateen intensiteetti",
        "lumensyvyys",
        "normalisoitu ilmanpaine",
        "näkyvyys"
    ]
    property var units: [
        "°C",
        "m/s",
        "m/s",
        "°",
        "%",
        "°C",
        "mm",
        "mm/h",
        "cm",
        "hPa",
        "m"
    ]

    Label {
        id: labelText
        x: Theme.paddingLarge
        color: Theme.secondaryHighlightColor
        font.pixelSize: Theme.fontSizeExtraSmall
        text: label[index]
    }
    Label {
        id: valueText
        anchors.left: parent.horizontalCenter
        anchors.top: labelText.bottom
        anchors.topMargin: Theme.paddingSmall
        text: obsval
    }
    Label {
        id: unitsText
        anchors.left: valueText.right
        anchors.leftMargin: Theme.paddingSmall
        anchors.baseline: valueText.baseline
        font.pixelSize: Theme.fontSizeSmall
        color: Theme.highlightColor
        text: units[index]
    }

}
