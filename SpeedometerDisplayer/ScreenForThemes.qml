import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15

Rectangle {
    id: screenThemes

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
            text: qsTr("Car Settings")
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
                    widthAnimation.running = !widthAnimation.running
                    heightAnimation.running = !heightAnimation.running
                }
            }
        }

    }


    Item {
        anchors {
            top: title.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            rightMargin: parent.width * 0.03
            leftMargin: parent.width * 0.03
            bottomMargin: 5
        }

        ListModel {
            id: themeName
            ListElement{ name: "Screen Bar Color"; icon: "qrc:/asset/brush (1).png"; Id: 1}
            ListElement{ name: "Fade Bar Color"; icon: "qrc:/asset/brush.png"; Id: 2}
            ListElement{ name: "Screen Displayer"; icon: "qrc:/asset/paint-brush.png"; Id: 3}
            ListElement{ name: "Fade Screen Displayer"; icon: "qrc:/asset/paint-pallet.png"; Id: 4}
            ListElement{ name: "Background Color"; icon: "qrc:/asset/palette.png"; Id: 5}
            ListElement{ name: "Button Color"; icon: "qrc:/asset/watercolor.png"; Id: 6}
            ListElement{ name: "Reset Colors"; icon: "qrc:/asset/circular.png"; Id: 7}
            ListElement{ name: "Meter Information"; icon: "qrc:/asset/info.png"; Id: 8}
        }

        Component {
            id: themeComponent
            Rectangle{
                height: mouseClick.containsPress ? grid_v.cellHeight - 30 - 2 : grid_v.cellHeight - 30
                width: mouseClick.containsPress ? grid_v.cellWidth -10 - 2 : grid_v.cellWidth -10
                radius: 5
                color: "#025a5c"


                Image {
                    id: themeIcon
                    source: model.icon
                    height: parent.height * 0.3
                    width: parent.width * 0.3

                    fillMode: Image.PreserveAspectFit
                    anchors.centerIn: parent
                }

                Text {
                    text: model.name
                    color: "lightgray"
                    anchors {
                        top: themeIcon.bottom
                        topMargin: 5
                        horizontalCenter: themeIcon.horizontalCenter
                    }
                }

                MouseArea{
                    id: mouseClick
                    anchors.fill: parent
                    onClicked: {
                     buttonClicked(model.Id)
                    }
                }
            }
        }

        GridView {
            id: grid_v
            anchors.fill: parent
            cellHeight: 170
            cellWidth: parent.width / 3
            model: themeName
            delegate: themeComponent
            clip: true
        }


    }







    // -------------------  >>>>>    settings for view

    SequentialAnimation on width {
        id: widthAnimation
        loops: 1
        PropertyAnimation {
            to: width === 0 ? parent.width * 0.65 : 0
            duration: 300
        }
    }

    SequentialAnimation on height {
        id: heightAnimation
        loops: 1
        PropertyAnimation {
            to: height === 0 ? parent.height * 0.6 : 0
            duration: 300
        }
    }


    Connections {
         target: engineInfor
         onButtonClicked: {
             if (screenBtn === 20 || screenBtn === 9) {
                 widthAnimation.running = !widthAnimation.running
                 heightAnimation.running = !heightAnimation.running
             }
         }
     }



   Connections {
        target: bottomBar
        onButtonClicked: {
            if (B_num === 3) {
                widthAnimation.running = !widthAnimation.running
                heightAnimation.running = !heightAnimation.running
            }
        }
    }


   Component.onCompleted: {
       widthAnimation.running = !widthAnimation.running
       heightAnimation.running = !heightAnimation.running
   }

    signal  buttonClicked(int id)
}
