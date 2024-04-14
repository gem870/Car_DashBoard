import QtQuick 2.15
import QtQuick.Dialogs 1.3

Item {
    id: colorPalette


    Connections{
        target: screenThemes
        onButtonClicked:{
            if(id === 1){
            onClicked: barColorDialog.open()
        }
       }

    }


    ColorDialog {
        id: barColorDialog
        title: "Select Color"
         signal colorAccepted(string color)
        onAccepted: {
               onAccepted: colorAccepted(color)
        }

    }


    // Connections{

    //     onButtonClicked:{
    //         onClicked: barFadColorDialog.open()
    //     }

    // }


    // ColorDialog {
    //     id: barFadColorDialog
    //     title: "Select Color"
    //     onAccepted: {
    //         colorRectangle.color = colorDialog.color
    //     }
    // }






    property string m_bars: "#141414"
    property string m_barsFad: "red"
    property string m_displayers: "#0f0f0f"
    property string m_displayerFad: "cyan"
    property string m_mainBackground: "black"

    function resetColor(){
        bottomBar.barColor =  m_bars
        bottomBar.barfadding = m_barsFad
        topBar.barColor =  m_bars
        topBar.barfadding = m_barsFad
        vehecleConfiguration.engineconfigColo = m_mainBackground
        screenThemes.engineconfigColo = m_mainBackground
        screenThemes.engineconfigColo = m_mainBackground
    }


}
