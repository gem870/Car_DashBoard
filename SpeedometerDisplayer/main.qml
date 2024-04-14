import QtQuick 2.15
import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Meter_D 1.2

Window {
    width: 1200
    height: 580
    visible: true
    title: qsTr("Speedometer")
    property string m_backgroung: "black"
    color: m_backgroung

    // property double rpm: m_parameters.rpmMeter
    // property double tyreDia: m_parameters.tyreDiameter
    // property double firstG: m_parameters.firstGearRatio
    // property double secondG: m_parameters.secondGearRatio
    // property double thirdG: m_parameters.thirdGearRatio
    // property double fourthG: m_parameters.fourthGearRation
    // property double fifthG: m_parameters.fifthGearRatio
    // property double sixthG: m_parameters.sixthGearRatio

    // signal engineParameters(double rpm, double tyreDia, double firstG, double secondG, double thirdG, double fourthG, double fifthG, double sixthG)
   // setValues: engineParameters(rpm, tyreDia, firstG, secondG, thirdG, fourthG, fifthG, sixthG)

    Meter_D {
        anchors.fill: parent



        Tempereture {
            id: temp
            anchors {
                topMargin: parent.height / 10
            }
        }
        FuelGuage {
            id: fuelguage
            anchors {
                topMargin: parent.height/10
            }
        }

       MainBoard {
           id: mainBoard
           anchors {
               topMargin: parent.height/10
           }
       }

       VehicleConfiguration {
           id: vehecleConfiguration
       }

        ScreenForThemes{
            id: screenThemes
        }

        EngineInfor{
            id: engineInfor
        }

        TopBar {
            id: topBar
        }

        BottomBar {
            id: bottomBar
        }

     }




    //   Canvas {
    //          anchors.fill: parent
    //          onPaint: {
    //              var pnt = getContext("2d")                     // <-------- gradient
    //              pnt.beginPath();
    //              pnt.reset();

    //              // Create a linear gradient
    //              var gradient = pnt.createLinearGradient(0, 0, parent.width, parent.height);
    //              gradient.addColorStop(0, "red"); // Start color
    //              gradient.addColorStop(0.5, "green"); // Middle color
    //              gradient.addColorStop(1, "blue"); // End color

    //              // Apply the gradient fill
    //              pnt.fillStyle = gradient;
    //              pnt.fillRect(0, 0, parent.width, parent.height);
    //          }
    //      }







}
