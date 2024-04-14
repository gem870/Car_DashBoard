import QtQuick 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: mainBoard
    width: parent.width * 0.65
    anchors {
        top: parent.top
        bottom: bottomBar.top
        horizontalCenter: bottomBar.horizontalCenter
    }
    color: Qt.rgba(0,0,0,0)
  //  border.color: "gray"
  //  border.width: 2

    QtObject{

    }


    KilometerBoard {
        id: kilometerBoard

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        width: parent.width/2
    }

    GearIndicator {
        id: gearIndicator
        anchors {
            left: kilometerBoard.right
            right: rpmBoard.left
            leftMargin: 10
            topMargin: parent.height/3
        }
        anchors.verticalCenter: rpmBoard.verticalCenter

    }

    RPMBoard {
        id: rpmBoard

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }
        width: parent.width/2 - 40

    }

}
