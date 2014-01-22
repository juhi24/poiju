import QtQuick 2.0
import Sailfish.Silica 1.0
import com.jolla.settings.system 1.0

Column {
    property var labelText: [
        "lämpötila",
        "tuulennopeus",
        "nopeus puuskissa",
        "tuulensuunta",
        "suhteellinen kosteus",
        "kastepiste",
        "tunnin sademäärä",
        "sateen intensiteetti",
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

    property int tmax: 50
    property int wmax: 50
    property int rainmax: 50

    property var maxval: [
        tmax,
        wmax,
        wmax,
        360,
        100,
        tmax,
        rainmax,
        rainmax,
        3,
        1070,
        60000
    ]

    property var valIsSigned: [
        true,
        false,
        false,
        false,
        false,
        true,
        false,
        false,
        false,
        false,
        false
    ]
    id: column
    width: parent.width/3
    spacing: Theme.paddingSmall

    ProgressCircleBase {
        id: circle
        width: parent.width - 2*Theme.paddingSmall
        height: width
        anchors {
            horizontalCenter: parent.horizontalCenter
            horizontalCenterOffset: index % 3 === 0 ? Theme.paddingSmall
                                                            : index % 3 === 2 ? -Theme.paddingSmall
                                                                              : 0
        }
        value: valIsSigned[index] ? (obsval+maxval[index])/(2*maxval[index]) : obsval/maxval[index]
        borderWidth: 2
        progressColor: Theme.highlightColor

        Label {
            anchors.centerIn: parent
            color: Theme.highlightColor
            textFormat: Text.RichText
            font {
                family: Theme.fontFamilyHeading
                pixelSize: Theme.fontSizeLarge
            }
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            text: obsval + "<span style='font-size:" + Theme.fontSizeExtraSmall + "px'>" + units[index] + "</span>"
        }
    }
    Label {
        id: label
        width: parent.width
        color: Theme.secondaryColor
        horizontalAlignment: Qt.AlignHCenter
        font.pixelSize: Theme.fontSizeSmall
        text: labelText[index]
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
}
