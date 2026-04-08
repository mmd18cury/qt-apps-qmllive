import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    width: livert.screenWidth
    height: livert.screenHeight

    property alias testText: textInput.text
    property alias pointSize: pointSizeSpinBox.value
    property alias showAllWeights: showAllWeightsCheckBox.checked

    property var defaultWeights: [
        { name: "Light",    weight: Font.Light },
        { name: "Regular",  weight: Font.Normal },
        { name: "DemiBold", weight: Font.DemiBold },
        { name: "Bold",     weight: Font.Bold },
        { name: "Black",    weight: Font.Black }
    ]

    Rectangle {
        id: header

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: 32
        z: 2
        color: "#E0E0E0"

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 8
            anchors.rightMargin: 8
            spacing: 8

            Label {
                text: "Font Size:"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                Layout.preferredWidth: 120
            }

            SpinBox {
                id: pointSizeSpinBox

                from: 0
                to: 50
                stepSize: 2
                value: 12
                editable: true

                Layout.preferredWidth: 80

                textFromValue: function(value, locale) {
                    return Number(value).toLocaleString(locale, "f", 0) + " pt"
                }

                valueFromText: function(text, locale) {
                    var cleaned = text.replace(/\s*pt\s*$/i, "").trim()
                    var v = Number.fromLocaleString(locale, cleaned)
                    return isNaN(v) ? value : v
                }
            }

            Label {
                text: "Example Text:"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                Layout.preferredWidth: 150
            }

            TextField {
                id: textInput
                text: "The quick brown fox jumps over the lazy dog"
                focus: true
                Layout.preferredWidth: 600
            }

            Label {
                text: "Show all QML font styles:"
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                Layout.preferredWidth: 250
            }

            CheckBox {
                id: showAllWeightsCheckBox
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    ScrollView {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        ListView {
            id: list
            model: styles

            delegate: ListView {
                id: familyDelegate

                property var style: styles[index]

                interactive: false
                width: parent.width
                height: childrenRect.height

                model: !showAllWeights ? style.weights : defaultWeights

                delegate: Column {
                    width: root.width
                    height: childrenRect.height + 20
                    anchors.margins: 2
                    spacing: 2

                    property string name: showAllWeights ? modelData.name : familyDelegate.style.weights[index].name
                    property int weight: showAllWeights ? modelData.weight : familyDelegate.style.weights[index].weight

                    Text {
                        text: familyDelegate.style.family + ", " + name
                    }

                    Rectangle {
                        color: "black"
                        height: 1
                        width: root.width
                    }

                    Text {
                        font.pointSize: root.pointSize
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "abcdefghijklmnopqrstuvwxyz"
                    }

                    Text {
                        font.pointSize: root.pointSize
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    }

                    Text {
                        font.pointSize: root.pointSize
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "0123456789.:;(*!?'/\\\")%&-+@~#<>{}[]"
                    }

                    Rectangle {
                        color: "black"
                        height: 1
                        width: root.width
                    }

                    Text {
                        font.pointSize: 6
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 8
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 10
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 18
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 24
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 30
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 36
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }

                    Text {
                        font.pointSize: 42
                        font.family: familyDelegate.style.family
                        font.weight: weight
                        text: "(" + font.pointSize + "pt) " + testText
                    }
                }
            }
        }
    }
}
