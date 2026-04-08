import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    width: livert.screenWidth
    height: livert.screenHeight

    property color backgroundColor: "#666"
    property color textColor: "#fff"

    Rectangle {
        anchors.fill: parent
        color: root.backgroundColor
    }

    Item {
        id: header

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 32
        z: 0

        Rectangle {
            anchors.fill: parent
            color: "#E0E0E0"
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            spacing: 6

            Repeater {
                model: [
                    { bg: "#000", text: "#fff" },
                    { bg: "#666", text: "#000" },
                    { bg: "#fff", text: "#000" }
                ]

                Rectangle {
                    width: 24
                    height: 24
                    radius: 2
                    color: modelData.bg
                    border.width: 1
                    border.color: "#404040"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.backgroundColor = modelData.bg
                            root.textColor = modelData.text
                        }
                    }
                }
            }

            Item {
                width: 16
                height: 16
                Layout.fillWidth: true
            }

            Slider {
                id: slider
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                from: 80
                to: 300
                value: 190
            }
        }
    }

    Component {
        id: gridDelegate

        FocusScope {
            id: delegateContainer
            width: grid.cellWidth - 4
            height: grid.cellHeight - 4

            Item {
                id: delegate
                anchors.fill: parent
                anchors.margins: 4

                function loadDocument() {
                    adapter.loadDocument(path + "/" + modelData)
                }

                focus: true

                Keys.onReturnPressed: delegate.loadDocument()
                Keys.onLeftPressed: grid.moveCurrentIndexLeft()
                Keys.onRightPressed: grid.moveCurrentIndexRight()
                Keys.onUpPressed: grid.moveCurrentIndexUp()
                Keys.onDownPressed: grid.moveCurrentIndexDown()

                Image {
                    id: image
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right

                    height: 0.8 * width
                    source: "image://qmlLiveDirectoryPreview/" + path + "/" + modelData
                    fillMode: Image.PreserveAspectFit
                    sourceSize.width: slider.to
                    sourceSize.height: slider.to
                    asynchronous: true
                    cache: false
                }

                Text {
                    id: label
                    anchors.top: image.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom

                    text: modelData
                    color: root.textColor
                    textFormat: Text.PlainText
                    elide: Text.ElideMiddle
                    horizontalAlignment: Text.AlignHCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: grid.currentIndex = index
                    onDoubleClicked: delegate.loadDocument()
                }
            }
        }
    }

    ScrollView {
        id: scrollView
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        GridView {
            id: grid
            cellWidth: slider.value
            cellHeight: slider.value
            keyNavigationWraps: true
            focus: true
            model: files
            delegate: gridDelegate

            highlight: Item {
                Rectangle {
                    width: grid.cellWidth
                    height: grid.cellHeight
                    color: "#33B5E5"
                    opacity: 0.5
                }
            }
        }
    }

    Component.onCompleted: scrollView.forceActiveFocus()
}
