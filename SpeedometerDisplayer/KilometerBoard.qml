import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id: kilometerBoard


    color: Qt.rgba(0,0,0,0)
    anchors {
        topMargin: parent.height * 0.07
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            m_parameters.isAccelerating = !m_parameters.isAccelerating
        }
    }


    CircularGauge {
        id: km_circularGuage
        anchors {
            fill: parent
            margins: parent.width/15 - 20
        }
        value: m_parameters.isAccelerating ? m_parameters.speed : 0
        maximumValue: 180
        InnerShadow {
            anchors.fill: parent
            radius: 8.0
            samples: 16
            horizontalOffset: -3
            verticalOffset: 3
            color: "blue"
            source:km_circularGuage
            opacity: 0.5
        }


        Keys.onLeftPressed: {
           m_parameters.isAccelerating = true
            console.log("printing data")
        }




        // Keys.onReleased: {
        //     if(event.key === Qt.Key_Up){
        //         m_parameters.isAccelerating = false
        //         event.accepted = true
        //     }

        // }


        Behavior on value {

            NumberAnimation {
                duration: 10000
            }
        }


        style: CircularGaugeStyle {

            function degreeR(deg){
                return deg * (Math.PI/ 180);
            }

            background: Canvas {
                onPaint: {
                    var drw = getContext("2d");
                    drw.reset();
                    drw.beginPath();

                    drw.strokeStyle = "red";
                    drw.lineWidth * 0.02;

                    drw.arc(outerRadius, outerRadius, outerRadius - drw.lineWidth / 2, degreeR(valueToAngle(120) -90),  degreeR(valueToAngle(180) -90))
                    drw.stroke();
                }

                Row {
                    id: kiloTex
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top: parent.verticalCenter
                        topMargin: outerRadius * 0.35
                    }

                    Text {
                        id: speedText
                        color: "lightgray"
                        font.pixelSize: outerRadius * 0.1
                        text: qsTr("km/h ")
                    }
                    Text {
                        id: uintSpeed
                        text: kmValue
                        color: "lightgray"
                        font.pixelSize: outerRadius * 0.1
                        readonly property int kmValue: km_circularGuage.value
                    }
                }





                Text {
                    id: gearTex

                    anchors{
                        top: kiloTex.bottom
                        topMargin: outerRadius * 0.35
                        horizontalCenter: kiloTex.horizontalCenter
                    }
                    text: "gr " + gearChange(km)
                    color: if(km >= 120)
                               return "red"
                           else return "#3e5e96"
                    font.pixelSize: outerRadius * 0.1

                    readonly property int km: km_circularGuage.value

                    function gearChange(km){
                        if(km === 0)
                            return 0;
                        else if(km <= 30)
                            return 1;
                        else if(km <= 50)
                            return 2;
                        else if(km <= 80)
                            return 3;
                        else if(km <= 120)
                            return 4;
                        else if(km <= 160)
                            return 5;
                        else
                            return 6;

                    }


                }


            }

            foreground: Item {
                Rectangle {
                    width: outerRadius * 0.2
                    height: width
                    radius: width/2
                    anchors.centerIn: parent
                    color: "blue"

                }






            }


            tickmark: Rectangle {

                visible: styleData.value < 120 || styleData.value % 10 == 0
                implicitHeight: outerRadius * 0.06
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                color: styleData.value >= 120 ? "#e34c22" : "#e5e5e5"

            }

            // minorTickmark: Rectangle {
            //     visible: styleData.value < 120
            //     implicitWidth: outerRadius * 0.01
            //     antialiasing: true
            //     implicitHeight: outerRadius * 0.03
            //     color: "#e5e5e5"
            // }



        }


        Component.onCompleted: {
            forceActiveFocus();
        }
    }

}
