import QtQuick 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3

Rectangle {
    id: bottomBar
    color: Qt.rgba(0,0,0,0)
    ColorPalette{
        id: colorPalette
    }



    // property string barColor: "#141414"
    // property string barfadding: "red"


    layer.enabled: true
    layer.effect: DropShadow {
        samples: 150
        color: colorPalette.m_barsFad
    }

    width: parent.width
    height: parent.height / 8
    anchors {
        bottom: parent.bottom
    }

    function drawItem(pnt){
        pnt.moveTo(0,height/2);
        pnt.lineTo(width/7, 0);
        pnt.lineTo(width/4.5, 0);
        pnt.lineTo(width/3.8, height/3);
        pnt.lineTo(width - width/3.8, height/3);
        pnt.lineTo((width - width/3.8) - width/7 + width/5.5, 0);
        pnt.lineTo(width - width/7, 0);
        pnt.lineTo(width - width/7 + width/7, height/2);
        pnt.lineTo(width - width/7 + width/7, height/2 + height/2);
        pnt.lineTo(0, height/2 + height/2);
        pnt.lineTo(0, height/2);
        pnt.fillStyle = colorPalette.m_bars;
        pnt.fill();

    }

    Canvas {
        id: bottomDraw
        anchors.fill: parent
        onPaint: {
            var pnt = getContext("2d");
            pnt.beginPath();
             pnt.reset();
            drawItem(pnt);  //  <--------- Function called
          //  pnt.lineWidth = 5;
            pnt.strokeStyle = colorPalette.m_bars;
            pnt.stroke();
        }
        opacity: 1
    }

   Rectangle {
       id: startButton
       height: parent.height * 0.7
       width: parent.width * 0.07
       radius: parent.width / 0.5
       anchors {
           bottom: parent.bottom
           left: parent.left
           leftMargin: parent.width / 7
           bottomMargin: parent.height / 6.5
       }
       color: startMouse.containsPress ? "gray" : "#1f1515"
       border.width: 2
       border.color: "gray"
       Text {
           id: buttonText
           text: qsTr("Settings")
           color: "lightgray"
           font.pixelSize: parent.width * 0.13
           anchors.centerIn: parent
       }

       MouseArea {
           id: startMouse
           anchors.fill: parent
           onClicked: {
                buttonClicked(3)
           }
       }

   }

   Item{
       id: leftNav
       height: bottomBar.height/2
       width: bottomBar.width/10
       anchors {
           left: parent.left
           leftMargin: parent.width * 0.03
           bottom: parent.bottom
           bottomMargin: parent.height * 0.05
       }


       Image {
           id: navIcon
           source: "qrc:/asset/fast-forward (1).png"
           height: parent.height/1.5
           width: parent.width/3
           anchors.centerIn: parent
       }

       MouseArea {
           id: leftNavMouse
           anchors.fill: parent
           onClicked: {
                buttonClicked(1)
           }
       }
   }

   Item{
       id: rightNav
       height: bottomBar.height/2
       width: bottomBar.width/10
       anchors {
           right: parent.right
           rightMargin: parent.width * 0.03
           bottom: parent.bottom
           bottomMargin: parent.height * 0.05
       }


       Image {
           id: navIcon2
           source: "qrc:/asset/fast-forward.png"
           height: parent.height/1.5
           width: parent.width/3
           anchors.centerIn: parent
       }

       MouseArea {
           id: rightNavMouse
           anchors.fill: parent
           onClicked: {
                buttonClicked(2)
           }
       }
   }




       Item{
           id: oneWay
           height: bottomBar.height/2
           width: bottomBar.width/10
           anchors {
               horizontalCenter: parent.horizontalCenter
               bottom: parent.bottom
               bottomMargin: parent.height * 0.05
           }

           Image {
               id: oneWayIcon
               source: "qrc:/asset/fast-forward (1).png"
               height: parent.height/1.5
               width: parent.width/3

               anchors.verticalCenter: parent.verticalCenter
               anchors{
                   left: parent.left
                   leftMargin: parent.width * 0.05
               }
           }

           Image {
               id: oneWayIcon2
               source: "qrc:/asset/fast-forward.png"
               height: parent.height/1.5
               width: parent.width/3

               anchors.verticalCenter: parent.verticalCenter
               anchors{
                   right: parent.right
                   rightMargin: parent.width * 0.05
               }
           }

           MouseArea {
               id: oneWayMouse
               anchors.fill: parent
               onClicked: {
                    buttonClicked(4)
               }
           }
       }




   Rectangle {
       id: configButton
       height: parent.height * 0.7
       width: parent.width * 0.07
       radius: parent.width / 0.5
       anchors {
           bottom: parent.bottom
           right: parent.right
           rightMargin: parent.width / 7
           bottomMargin: parent.height / 6.5
       }
       color: brakeMouse.containsPress ? "gray" : "#1f1515"
       border.width: 2
       border.color: "gray"
       Text {
           id: brakeText
           color: "lightgray"
           text: qsTr("    Engine\nConfiguration")
           font.pixelSize: parent.width * 0.13
           anchors.centerIn: parent
       }

       MouseArea {
           id: brakeMouse
           anchors.fill: parent
           onClicked: {
               buttonClicked(5)
           }
           onDoubleClicked: {
               buttonClicked(5)
           }
       }

   }

   Connections {
       target: screenThemes
       onButtonClicked: {
           if(id === 1){
               console.log("1")
           } else if(id === 2){
               console.log("2")
           }else if(id === 3){
               console.log("4")
           }
       }
   }

signal buttonClicked(int B_num)
}
