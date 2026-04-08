import QtQuick

Item {
    id: root
    width: livert.screenWidth
    height: livert.screenHeight

    Rectangle {
        anchors.fill: parent
        color: imageViewerBackgroundColor
    }

    Image {
        id: image
        anchors.centerIn: parent
        source: imageViewerSource
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 4
        color: "#ffffff"
        text: image.width + "x" + image.height
    }
}
