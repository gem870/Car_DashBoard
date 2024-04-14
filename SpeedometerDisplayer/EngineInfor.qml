import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: engineInfor

    property string displayColo: "#0f0f0f"

    height: 0
    width: 0
    color: displayColo
    radius: 2
    opacity: 0.95
    anchors {
        centerIn: parent
    }
    layer.enabled: true
    layer.effect: DropShadow {
        samples: 400
        radius: 60
        color: "cyan"
    }


    Item {
        id: title
        height: parent.height * 0.1
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: parent.height * 0.02
        }
        Text {
            id: themTex
            text: qsTr("Current Meter Values")
            color: "gray"
            font.bold: true
            font.pixelSize: parent.width * 0.03
            anchors.centerIn: parent
        }

        Text {
            id: counsleTex
            text: qsTr("X")
            color: "gray"
            font.bold: true
            font.pixelSize: parent.width * 0.03
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 20
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    widthAnimation2.running = !widthAnimation2.running
                    heightAnimation2.running = !heightAnimation2.running
                    buttonClicked(20)
                }
            }
        }
    }




    ListView {
        anchors {
            top: title.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        Row {
            id: rpmM
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: parent.top
                topMargin: 10
            }

            Text {
                text: "Engine RPM:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.rpmMeter
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: tyr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: rpmM.bottom
                topMargin: 10
            }
            Text {
                text: "Tyre Diameter: "
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.tyreDiameter
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: fgr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: tyr.bottom
                topMargin: 10
            }
            Text {
                text: "First Gear Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.fifthGearRatio
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: sgr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: fgr.bottom
                topMargin: 10
            }
            Text {
                text: "Second Gear Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.secondGearRatio
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: thgr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: sgr.bottom
                topMargin: 10
            }
            Text {
                text: "third Gear Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.thirdGearRatio
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: furgr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: thgr.bottom
                topMargin: 10
            }
            Text {
                text: "Fourth Gear Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.fourthGearRation
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: fifgr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: furgr.bottom
                topMargin: 10
            }
            Text {
                text: "Fifth Gear Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.fifthGearRatio
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: sixgr
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: fifgr.bottom
                topMargin: 10
            }
            Text {
                text: "Sixth Gear Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.sixthGearRatio
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

        Row {
            id: driveRatio
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 20
            height: 20
            anchors {
                top: sixgr.bottom
                topMargin: 10
            }
            Text {
                text: "Drive Ratio:"
                color: "lightgray"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }
            }

            Text {
                text: m_parameters.driveRatio
                color: "green"
                font.pixelSize: 16
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }
        }

    }





















    // -------------------  >>>>>    settings for view

    SequentialAnimation on width {
        id: widthAnimation2
        loops: 1
        PropertyAnimation {
            to: width === 0 ? parent.width * 0.65 : 0
            duration: 300
        }
    }

    SequentialAnimation on height {
        id: heightAnimation2
        loops: 1
        PropertyAnimation {
            to: height === 0 ? parent.height * 0.6 : 0
            duration: 300
        }
    }

   Connections {
        target: screenThemes
        onButtonClicked: {
            if (id === 8) {
                widthAnimation2.running = !widthAnimation2.running
                heightAnimation2.running = !heightAnimation2.running
                buttonClicked(9)
            }
        }
    }



   Component.onCompleted: {
       widthAnimation2.running = !widthAnimation2.running
       heightAnimation2.running = !heightAnimation2.running
   }

 signal buttonClicked(int screenBtn)
}
