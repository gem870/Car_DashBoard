import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id: fuelguage
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right: parent.right
    }
    color: Qt.rgba(0,0,0,0)
  //  border.color: "gray"
  //  border.width: 2
    width: parent.width/6

    Image {
        id: right_navigator
        visible: false
        source: "qrc:/asset/fast-forward (3).png"
        height: parent.height/15
        width: parent.width/4
        anchors {
            top: parent.top
            left: parent.left
            rightMargin: 20
            topMargin: 30
        }

        fillMode: Image.PreserveAspectFit

        Timer{
            id: timer
            interval: 501
            repeat: true
            onTriggered: {
               right_navigator.visible = !right_navigator.visible
            }
        }
    }

    Image {
        id: right_navigator2
        visible: false
        source: "qrc:/asset/fast-forward (3).png"
        height: parent.height/15
        width: parent.width/4
        anchors {
            top: parent.top
            left: right_navigator.right
            topMargin: 30
            leftMargin: -25
        }

        fillMode: Image.PreserveAspectFit

        Timer{
            id: timer2
            interval: 502
            repeat: true
            onTriggered: {
               right_navigator2.visible = !right_navigator2.visible
            }
        }
    }

    Image {
        id: right_navigator3
        visible: false
        source: "qrc:/asset/fast-forward (3).png"
        height: parent.height/15
        width: parent.width/4
        anchors {
            top: parent.top
            left: right_navigator2.right
            topMargin: 30
            leftMargin: -25
        }

        fillMode: Image.PreserveAspectFit

        Timer{
            id: timer3
            interval: 503
            repeat: true
            onTriggered: {
               right_navigator3.visible = !right_navigator3.visible
            }
        }
    }

    Connections {
        target: bottomBar
        onButtonClicked: {
            if(B_num === 2 || B_num === 4){
                    timer.running = !timer.running
                    timer2.running = !timer2.running
                    timer3.running = !timer3.running

                    right_navigator.visible = false
                    right_navigator2.visible = false
                    right_navigator3.visible = false

            }
        }
    }

    CircularGauge {
        id: fuelMeter
        width: parent.height * 0.45
        height: parent.height * 0.45
        value: m_parameters.fuelGuage
        maximumValue: 100
        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: parent.height * -0.07
            rightMargin: parent.width * 0.40
        }


        style: CircularGaugeStyle {

            function degreeR(deg){
                return deg * (Math.PI/ 180);
            }

            labelStepSize: 10
            labelInset: outerRadius * 0.3
            minimumValueAngle: 90
            maximumValueAngle: 0


            background: Canvas {
                onPaint: {
                    // var drw = getContext("2d");
                    // drw.reset();
                    // drw.beginPath();

                    // drw.strokeStyle = "red";
                    // drw.lineWidth * 0.02;

                    // drw.arc(outerRadius, outerRadius, outerRadius - drw.lineWidth / 2, degreeR(valueToAngle(120) -90),  degreeR(valueToAngle(180) -90))
                    // drw.stroke();
                }
                layer.enabled: true
                layer.effect: DropShadow {
                    color: "gray"
                    samples: 600
                    radius: 60
                }

                Image {
                    id: fuelIcon
                    source: m_parameters.fuelGuage <= 15 ? "qrc:/asset/petrol-station.png" : "qrc:/asset/petrol-station (1).png"
                    height: parent.height * 0.15
                    width: parent.width * 0.15
                    anchors{
                        top: parent.verticalCenter
                        topMargin: outerRadius * -0.45
                        right: parent.right
                        rightMargin: parent.width * 0.25
                    }


                }


                Row {
                    id: fuelTex
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top: parent.verticalCenter
                        topMargin: outerRadius * 0.2
                    }

                    Text {
                        id: fuelText
                        color: "cyan"
                        font.pixelSize: outerRadius * 0.15
                        text: qsTr("fuel")
                    }

                }

            }

            tickmarkLabel: Text {
                text: styleData.value === 100 ? "F" : (styleData.value === 0 ? "E" : "")
                font.pixelSize: Math.max(15, outRadius * 0.1)
                color: "cyan"
            }

            tickmark: Rectangle {

                visible: styleData.value % 20 == 0
                implicitHeight: outerRadius * 0.12
                implicitWidth: outerRadius * 0.05
                antialiasing: true
                color: styleData.value <= 10 ? "#e34c22" : (styleData.value <= 40 ? "#fabc02" : "gray")
                opacity: 0.5
            }


        }


        Component.onCompleted: {
            forceActiveFocus();
        }
    }




}
