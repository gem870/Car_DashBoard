import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.15


Item {
    id: rpmBoard

    anchors {
        topMargin: parent.height * 0.1
    }

    CircularGauge {
        id: rpm_circularGuage
        anchors {
            fill: parent
            margins: parent.width/10 + -10
        }
        value: m_parameters.rpmValueChange
        maximumValue: m_parameters.rpmMeter


        // Behavior on value{
        //     NumberAnimation {
        //         duration: 500
        //     }
        // }

         InnerShadow {
             anchors.fill: parent
             radius: 8.0
                     samples: 16
                     horizontalOffset: -3
                     verticalOffset: 3
                     color: "green"
                     source:rpm_circularGuage
                     opacity: 0.3
        }
        style: CircularGaugeStyle {

            labelStepSize: 1000

            background: Canvas {
                Row {
                    id: kiloTex
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        top: parent.verticalCenter
                        topMargin: outerRadius * 0.35
                    }


                    Text {
                        id: rpmText
                        text: "rpm " + kmValue
                        color: "lightgray"
                        font.pixelSize: outerRadius * 0.1
                        readonly property int kmValue: km_circularGuage.value
                    }
                }
            }

            tickmark: Rectangle {

                visible: styleData.value % 100 == 0
                implicitHeight: outerRadius * 0.06
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                color: "#e5e5e5"

            }

            // foreground: Item {
            //     Rectangle {
            //         width: outerRadius * 0.2
            //         height: width
            //         radius: width/2
            //         anchors.centerIn: parent
            //         color: "blue"

            //     }
            // }







        }



    }


}
