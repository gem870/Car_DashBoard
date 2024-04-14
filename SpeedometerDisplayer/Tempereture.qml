import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id: temp
    anchors {
        top: parent.top
        bottom: bottomBar.top
        left: parent.left
    }

    property string displayColo: "#0f0f0f"

    color: Qt.rgba(0,0,0,0)
   // border.color: "gray"
   // border.width: 2
    width: parent.width /6


    Image {
        id: left_navigator
        visible: false
        source: "qrc:/asset/fast-forward (2).png"
        height: parent.height/15
        width: parent.width/4
        anchors {
            top: parent.top
            right: parent.right
            topMargin: 30
        }

        fillMode: Image.PreserveAspectFit



        Timer{
            id: timer
            interval: 501
            repeat: true
            onTriggered: {
               left_navigator.visible = !left_navigator.visible
            }
        }
    }

    Image {
        id: left_navigator2
        visible: false
        source: "qrc:/asset/fast-forward (2).png"
        height: parent.height/15
        width: parent.width/4
        anchors {
            top: parent.top
            right: left_navigator.left
            topMargin: 30
            rightMargin: -25
        }

        fillMode: Image.PreserveAspectFit



        Timer{
            id: timer2
            interval: 502
            repeat: true
            onTriggered: {
               left_navigator2.visible = !left_navigator2.visible
            }
        }
    }

    Image {
        id: left_navigator3
        visible: false
        source: "qrc:/asset/fast-forward (2).png"
        height: parent.height/15
        width: parent.width/4
        anchors {
            top: parent.top
            right: left_navigator2.left
            topMargin: 30
            rightMargin: -25
        }

        Timer{
            id: timer3
            interval: 503
            repeat: true
            onTriggered: {
               left_navigator3.visible = !left_navigator3.visible
            }
        }

        fillMode: Image.PreserveAspectFit
    }



    Connections {
        target: bottomBar
        onButtonClicked: {
            if(B_num === 1 || B_num === 4){
                    timer.running = !timer.running
                    timer2.running = !timer2.running
                    timer3.running = !timer3.running

                    left_navigator.visible = false
                    left_navigator2.visible = false
                    left_navigator3.visible = false

            }
        }
    }

    Rectangle {
        id: leftIocns
        height: parent.height * 0.45
        width: parent.width * 0.25
        radius: 3
        color: displayColo
        anchors {
           top: parent.top
           left: parent.left
           topMargin: parent.width * 0.4
           leftMargin: parent.width * 0.3
        }
        layer.enabled: true
        layer.effect: DropShadow {
            color: "cyan"
            samples: 600
            radius: 60
        }

        Image {
            id: lightIcon
            source: "qrc:/asset/headlamp-removebg-preview (1).png"
            height: parent.height * 0.2
            width: parent.width * 0.70
            anchors{
               horizontalCenter:  parent.horizontalCenter
               top: parent.top
               topMargin: parent.height * 0.05
            }
            opacity: 0.7
        }

        Image {
            id: packingLightIcon
            source: "qrc:/asset/parkinglight.png"
            height: parent.height * 0.2
            width: parent.width * 0.70
            anchors{
               horizontalCenter:  parent.horizontalCenter
               top: lightIcon.bottom
               topMargin: parent.height * 0.05
            }
            opacity: 0.7
        }

        Image {
            id: tyreIcon
            source: "qrc:/asset/tire-removebg-preview.png"
            height: parent.height * 0.15
            width: parent.width * 0.65
            anchors{
               horizontalCenter:  parent.horizontalCenter
               top: packingLightIcon.bottom
               topMargin: parent.height * 0.05
            }
            opacity: 0.7
        }

        Image {
            id: batteryIcon
            source: "qrc:/asset/car-battery.png"
            height: parent.height * 0.15
            width: parent.width * 0.65
            anchors{
               horizontalCenter:  parent.horizontalCenter
               top: tyreIcon.bottom
               topMargin: parent.height * 0.05
            }
            opacity: 0.7
        }




    }


    CircularGauge {
        id: tempMeter
        width: parent.height * 0.45
        height: parent.height * 0.45
        value: m_parameters.engineTemp
        maximumValue: 70
        anchors {
            bottom: parent.bottom
            left: parent.left
            bottomMargin: parent.height * -0.07
            leftMargin: parent.width * 0.35
        }

        style: CircularGaugeStyle {

            function degreeR(deg){
                return deg * (Math.PI/ 180);
            }

            labelStepSize: 10
            labelInset: outerRadius * 0.4
            minimumValueAngle: -90
            maximumValueAngle: 0


            Component.onCompleted: {
                tempTimer.start()
            }


            background: Canvas {
                onPaint: {
                    var drw = getContext("2d");
                    drw.reset();
                    drw.beginPath();

                    drw.strokeStyle = "cyan";
                    drw.lineWidth * 0.02;

                    drw.arc(outerRadius, outerRadius, outerRadius - drw.lineWidth / 2, degreeR(valueToAngle(120)+115),  degreeR(valueToAngle(190)+ 115))
                    drw.stroke();

                }
                layer.enabled: true
                layer.effect: DropShadow {
                    color: "cyan"
                    samples: 600
                    radius: 60
                }

                Image {
                    id: tempIcon
                    source:  "qrc:/asset/thermometer.png"
                    height: parent.height * 0.15
                    width: parent.width * 0.15
                    opacity: 0.5
                    anchors{
                        top: parent.verticalCenter
                        topMargin: outerRadius * -0.45
                        left: parent.left
                        leftMargin: parent.width * 0.25
                    }


                }

                Row {
                    id: tempTex
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top: parent.verticalCenter
                        topMargin: outerRadius * 0.2
                        centerIn: parent
                    }


                    Text {
                        id: tempsymbol
                        color: "cyan"
                        font.pixelSize: outerRadius * 0.15
                        text: "Temp."
                        topPadding: outerRadius * 0.5
                    }



                }

            }

            tickmarkLabel: Text {
                text: styleData.value === 10 ? "C" : (styleData.value === 50 ? "H" : "")
                font.pixelSize: Math.max(15, outRadius * 0.1)
                color: "cyan"
            }

            tickmark: Rectangle {

                visible: styleData.value % 20 == 0
                implicitHeight: outerRadius * 0.12
                implicitWidth: outerRadius * 0.05
                antialiasing: true
                color: styleData.value <= 20 ? "green" : "#e34c22"
                opacity: 0.5
            }


        }

    }





}
