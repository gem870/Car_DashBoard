import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Item {
    id: tempControlScreen
    width: parent.width
    clip: true
    height:parent.height/1.05
    property string textBackgroundColor: "gray"
    property string textColor: "lightgray"
    property string buttonColor: "gray"
    property string borderColor: "lightgray"



    Item {
        id: page1
        width: tempControlScreen.width/2
        height: parent.height
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            leftMargin: parent.width/12 - 15
            topMargin: parent.height/14 +50
            bottomMargin: parent.height/14 +50
        }
        clip: true

        ListModel {

        }



        ScrollView{
            anchors.fill: parent
            clip: true
            Column{
                clip: true
                width: parent.width
                height: parent.height
                Item{
                    width: parent.width
                    height: 550



                    Rectangle {
                        id: backgroung1
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: parent.top
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Maximum RPM:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input1

                            width: parent.width
                            height: parent.height/ 2
                            text: m_parameters.rpmMeter
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung2
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung1.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Tyre Diameter:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input2
                            width: parent.width
                            text: m_parameters.tyreDiameter
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung3
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung2.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("First Gear Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input3
                            width: parent.width
                            text: m_parameters.firstGearRatio
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung4
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung3.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Second Gear Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input4
                            width: parent.width
                            text: m_parameters.secondGearRatio
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung5
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung4.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Third Gear Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input5
                            width: parent.width
                            text: m_parameters.thirdGearRatio
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung6
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung5.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Fourth Gear Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input6
                            width: parent.width
                            text: m_parameters.fourthGearRation
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung7
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung6.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Fifth Gear Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input7
                            width: parent.width
                            text: m_parameters.fifthGearRatio
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung8
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung7.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Sixth Gear Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input8
                            width: parent.width
                            text: m_parameters.sixthGearRatio
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                    Rectangle {
                        id: backgroung9
                        height: 50
                        width: parent.width * 0.8
                        radius: 5
                        color: Qt.rgba(0,0,0,0)
                        border.color: textBackgroundColor
                        border.width: 1
                        anchors{
                            top: backgroung8.bottom
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: qsTr("Drive Ratio:")
                            color: textColor
                            leftPadding: 5
                            anchors.top: parent.top
                            topPadding: 2
                        }

                        TextField{
                            id: input9
                            width: parent.width
                            text: m_parameters.driveRatio
                            height: parent.height/ 2
                            anchors{
                                bottom: parent.bottom
                                topMargin: 5
                                bottomMargin: 5
                            }
                        }
                    }

                }
            }
        }


    }



    BusyIndicator {
        id: busyIndicator
        running: false
        anchors {
            top: parent.top
            bottom: resectButton.top
            left: page1.right
            right: parent.right
            rightMargin: parent.width * 0.3
            topMargin: parent.width * 0.1
            leftMargin: parent.width * 0.04
            bottomMargin: parent.width * 0.01
        }

    }

    Image {
        id: doneIcon
        visible: false
        source: "qrc:/asset/checked.png"
        height: parent.height * 0.08
        width: parent.width * 0.08
        anchors {
            centerIn: busyIndicator
        }
        fillMode: Image.PreserveAspectCrop

        Timer{
            id: runTim
            interval: 3000
            repeat: false
            onTriggered: {
                doneIcon.visible = false
                texIcon.visible = false
            }
        }
    }



    Text {
        id: texIcon
        visible: false
        text: qsTr("Done!")
        color: textColor
        topPadding: 5
        anchors{
            top: doneIcon.bottom
            horizontalCenter: doneIcon.horizontalCenter
        }
    }


    Timer{
        id: timeMe
        interval: 2000
        repeat: false
        onTriggered: {
            busyIndicator.running = false
            doneIcon.visible = true
            texIcon.visible = true
            runTim.start()
        }
    }


    Timer{
        id: resetValueTimer
        interval: 3000
        repeat: false
        onTriggered: {
            m_parameters.rpmMeter = 5000
            m_parameters.tyreDiameter = 680
            m_parameters.firstGearRatio = 2.7
            m_parameters.secondGearRatio = 2.1
            m_parameters.thirdGearRatio = 1.5
            m_parameters.fourthGearRation = 1
            m_parameters.fifthGearRatio = 0.85
            m_parameters.sixthGearRatio = 0.6
            m_parameters.driveRatio = 3.4
            buttonClicked(6)
        }
    }

    // Component.onCompleted: {
    //     maxEngineTimer.start()
    // }

    // Timer{
    //     id: maxEngineTimer
    //     interval: 100
    //     repeat: true
    //     onTriggered: {
    //         m_parameters.maxEngineRPM = input1.text
    //     }
    // }



    Timer{
        id: upDatValueTimer
        interval: 3000
        repeat: false
        onTriggered: {
            m_parameters.rpmMeter = input1.text
            m_parameters.tyreDiameter = input2.text
            m_parameters.firstGearRatio = input3.text
            m_parameters.secondGearRatio = input4.text
            m_parameters.thirdGearRatio = input5.text
            m_parameters.fourthGearRation = input6.text
            m_parameters.fifthGearRatio = input7.text
            m_parameters.sixthGearRatio = input8.text
            m_parameters.driveRatio = input9.text
            buttonClicked(6)
        }
    }





    Rectangle {
        id: resectButton
        height: resetMouse.containsPress ? parent.height * 0.08 -2 : parent.height * 0.08
        width: resetMouse.containsPress ? parent.width * 0.25 -2 : parent.width * 0.25
        color: buttonColor
        radius: 10
        border.color: borderColor
        border.width: 1
        anchors {
            right: parent.right
            rightMargin: parent.width * 0.2
            verticalCenter: parent.verticalCenter
        }

        Text {
            text: qsTr("Reset Speed Meter")
            anchors.centerIn: parent
        }
        MouseArea{
            id: resetMouse
            anchors.fill: parent
            onClicked: {
                busyIndicator.running = true
                timeMe.start()
                resetValueTimer.start()

            }
        }
    }

    Rectangle {
        id: upDateButton
        height: upDateMouse.containsPress ? parent.height * 0.08 -2 : parent.height * 0.08
        width: upDateMouse.containsPress ? parent.width * 0.25 -2 : parent.width * 0.25
        color: buttonColor
        radius: 10
        border.color: borderColor
        border.width: 1
        anchors {
            top: resectButton.bottom
            topMargin: 30
            right: parent.right
            rightMargin: parent.width * 0.2
        }

        Text {
            text: qsTr("Update Speed Meter")
            anchors.centerIn: parent
        }
        MouseArea{
            id: upDateMouse
            anchors.fill: parent
            onClicked: {
                busyIndicator.running = true
                timeMe.start()
                upDatValueTimer.start()


            }
        }
    }













    //             Animations  <------


    Behavior on y {
        NumberAnimation {
            duration: 500
        }
    }

    // MouseArea {
    //     id: dragArea
    //     anchors.fill: parent
    //     drag.target: parent
    //     drag.axis: Drag.YAxis
    //     drag.minimumY: parent.height - tempControlScreen.height
    //     drag.maximumY: parent.height

    //     onReleased: {
    //         if (dragArea.drag.active) {
    //             if (tempControlScreen.y < parent.height / 1.1) {
    //                 tempControlScreen.y = parent.height - tempControlScreen.height;
    //             } else {
    //                 tempControlScreen.y = parent.height / 1.1;
    //             }
    //         }
    //     }
    // }



    Timer {
        id: timer2
        interval: 300
        repeat: false
        onTriggered: {
            if (tempControlScreen.y === parent.height / 1.01) {
                tempControlScreen.y = parent.height - tempControlScreen.height;
            } else {
                tempControlScreen.y = parent.height / 1.01;
            }
        }
    }

    Timer {
        interval: 300
        repeat: true
        Component.onCompleted: {
            if (tempControlScreen.y === parent.height / 1.01) {
                tempControlScreen.y = parent.height - tempControlScreen.height;
            } else {
                tempControlScreen.y = parent.height / 1.01;
            }
        }

    }







    Connections {
        target: bottomBar
        onButtonClicked: {
            if(B_num === 5){
                timer2.running = !timer2.running
            }
        }
    }





    signal buttonClicked(int c_num)

}



