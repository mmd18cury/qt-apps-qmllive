import QtQuick
import QtQuick.Controls

Rectangle {
    width: 800
    height: 480
    color: palette.base

    SystemPalette {
        id: palette
        colorGroup: SystemPalette.Active
    }

    Image {
        anchors.fill: parent
        source: "logo.png"
        fillMode: Image.PreserveAspectFit
        opacity: 0.5
    }

    Label {
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: qsTr("An error occurred - please check the Log Output pane. (Controls)")
        font.pixelSize: 20
        font.bold: true
        color: palette.text
    }
}
