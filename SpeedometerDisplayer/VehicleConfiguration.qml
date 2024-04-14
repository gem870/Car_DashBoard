import QtQuick 2.15

Rectangle {
    id: vehecleConfiguration

    property string engineconfigColo: "black"

    width: parent.width * 0.46
    anchors {
        top: topBar.bottom
        bottom: bottomBar.top
        right: parent.right
        bottomMargin: 10
    }
    radius: 3
    color: Qt.rgba(0,0,0,0)
    visible: false
    opacity: 0
    clip: true


    Canvas {
        anchors.fill: parent
        onPaint: {
            var pnt = getContext("2d");
            pnt.beginPath();
            pnt.reset();

            pnt.moveTo(0, parent.height);
            pnt.lineTo(parent.width, parent.height);
            pnt.lineTo(parent.width, 0);
            pnt.lineTo(0, 0);
            pnt.moveTo(0, parent.height);


            pnt.stroke();
            pnt.fillStiyle = engineconfigColo
            pnt.fill()
        }
        opacity: 0.8

    }

    Behavior on opacity {
               NumberAnimation {
                   duration: 300 // Animation duration in milliseconds
               }
           }




    PropertyAnimation {
        id: opacityAnimation
        target: vehecleConfiguration
        property: "opacity"
        from: 0
        to: 1
        duration: 3000
    }


    Connections {
        target: bottomBar
        onButtonClicked: {
            if(B_num === 5){
                vehecleConfiguration.visible = !vehecleConfiguration.visible
                vehecleConfiguration.opacity = vehecleConfiguration.visible ? 1 : 0;
            }
        }
    }



    ConfigurationPage {
        id: configurationPage
    }








  }


