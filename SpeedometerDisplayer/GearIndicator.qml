import QtQuick 2.15

Item {
    id: gearIdicator


    height: 150
    width: 40

    Text {
        id: p
        text: qsTr("P")
        color: "lightgray"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 40
        }
        font.pixelSize: parent.width/2
    }


    Text {
        id: n
        text: qsTr("N")
        color: "gray"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: p.bottom
            topMargin: 20
        }
        font.pixelSize: parent.width/2
    }

    Text {
        id: d
        text: qsTr("D")
        color: "#21c442"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: n.bottom
            topMargin: 20
        }
        font.pixelSize: parent.width/2
    }

    Image {
        id: sitBeltIcon

        visible: false
        source: sitBelt1
        anchors {
            top: d.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 20
        }
        height: 40
        width: 40

        Timer{
            id: sitBeltIconTimer
            interval: 700
            repeat: true
            running: false

            onTriggered: {
                sitBeltIcon.visible = !sitBeltIcon.visible
            }
        }
        Component.onCompleted: sitBeltIconTimer.start()
    }



    property string sitBelt1: "qrc:/asset/sitBelt1-removebg-preview.png"
}
