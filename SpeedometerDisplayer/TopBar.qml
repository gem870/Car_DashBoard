import QtQuick 2.15
import QtGraphicalEffects 1.15


Rectangle {
    id: topBar

    ColorPalette{
        id: colorPalette
    }

    height: parent.height / 7
    width: parent.width
    anchors.top: parent.top
    color: Qt.rgba(0,0,0,0)
    layer.enabled: true
    layer.effect: DropShadow {
        samples: 150
        color: colorPalette.m_barsFad
    }

    Canvas {
        anchors.fill: parent
        onPaint: {
            var pnt = getContext("2d")
            pnt.beginPath();
            pnt.reset();

            // Draw a line from (0, 0) to (parent.width, parent.height)
            pnt.moveTo(0, parent.height/2);
            pnt.lineTo(parent.width/8, parent.height/1.3);
            pnt.lineTo(parent.width - parent.width/8, parent.height/1.3);
            pnt.lineTo((parent.width - parent.width/8)+parent.width/8, parent.height/2);
            pnt.lineTo((parent.width - parent.width/8)+parent.width/8, 0);
            pnt.lineTo(0, 0);
            pnt.lineTo(0, parent.height/2);

            // pnt.lineWidth = 2;
            // pnt.strokeStyle = "red";
            pnt.stroke();

            pnt.fillStyle = colorPalette.m_bars;
            pnt.fill();
        }
        opacity: 1
    }
}

