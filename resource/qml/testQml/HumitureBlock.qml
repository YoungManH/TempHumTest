import QtQuick 1.1
import MainView 1.0
Item {
    property string tempUnitSource: "qrc:/resource/images/test/tempunit.png"
    property string rhUnitSource: "qrc:/resource/images/test/larghRhUnit.png"

    height: 60
    width: 854
    id:rooeRect
    property string fontName: "MI LANTING"
    property int fontSize: 24

    Item{
        id:itemTemp
        height: parent.height
        width: 213
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 1

        Text {
            id:tempLogo
            text: qsTr("Temp")
            color: "#ffffff"
            //字体
            font.bold: true
            font.family: fontName
            font.pixelSize: fontSize


            anchors{
                top: parent.top
                left: parent.left
                topMargin: 22
                leftMargin: 19
            }
        }

        Text {
            id:tempText
            color: "#ffffff"
            //字体
            font.family: fontName
            font.pixelSize: fontSize
            font.bold: true
            anchors{
                top: parent.top
                left: tempLogo.right
                topMargin: 22
                leftMargin: 20
            }

        }

    }

    Item{
        id:itemHum
        height: parent.height
        width: 213
        anchors.top: parent.top
        anchors.left:  itemTemp.right
        anchors.leftMargin: 0


        Text {
            id:rhDes
            text: qsTr("RH")
            color: "#ffffff"
            anchors{
                top: parent.top
                left: parent.left
                topMargin: 22
                leftMargin: 20
            }
            //字体
            font.family: fontName
            font.pixelSize: fontSize
            font.bold: true

        }

        Text {
            anchors{
                top: parent.top
                left: rhDes.right
                topMargin: 22
                leftMargin: 20
            }
            id:rhText
            color: "#ffffff"
            //字体
            font.family: fontName
            font.pixelSize: fontSize
            font.bold: true
        }


    }

    Item{
        id:itemTvoc
        height: parent.height
        width: 213
        anchors.top: parent.top
        anchors.left:  itemHum.right
        anchors.leftMargin: 0


        Text {
            anchors{
                top: parent.top
                left: parent.left
                topMargin: 22
                leftMargin: 15
            }
            id:tvocDes
            text: qsTr("tVOC")
            color: "#ffffff"
            //字体
            font.family: fontName
            font.pixelSize: fontSize
            font.bold: true

        }

        Text {
            anchors{
                top: parent.top
                left: tvocDes.right
                topMargin: 22
                leftMargin: 15
            }
            id:tvovText
            color: "#ffffff"
            //字体
            font.family: fontName
            font.pixelSize: fontSize
            font.bold: true
        }

    }
    Item{
        id:itemCo2e
        height: parent.height
        width: 213
        anchors.top: parent.top
        anchors.left:  itemTvoc.right
        anchors.leftMargin: 0



        Text {
            anchors{
                top: parent.top
                left: parent.left
                topMargin: 22
                leftMargin: 15
            }
            id:co2eDesc
            text: qsTr("CO2e")
            color: "#ffffff"
            //字体
            font.family: fontName
            font.pixelSize: fontSize
            font.bold: true

        }

        Text {
            anchors{
                top: parent.top
                right: parent.right
                topMargin: 22
                rightMargin: 15
            }
            id:co2eText
            color: "#ffffff"
            //字体
            font.family: fontName
            font.pixelSize: fontSize
        }


    }







    //信号槽绑定 修改湿度值
    Connections {

        target:MainViewProperty
        onSignal_humChanged:
            rhText.text =deal_with(Math.round(MainViewProperty.slot_getHumValue() * 100) /100) +"%"
        onSignal_tempChanged:
            tempText.text =  deal_with(Math.round(MainViewProperty.slot_getTempValue() * 100) / 100) + "℃"
        onSignal_tVOCValueChanged:
        {
            console.log("tvoc = ", MainViewProperty.slot_getTvocValue())

            tvovText.text = Math.round(MainViewProperty.slot_getTvocValue()) + "ppb" ;
        }
        onSignal_CO2evaluechanged:
        {
            console.log("co2 = ", MainViewProperty.slot_getCO2eValue())

            co2eText.text = Math.round(MainViewProperty.slot_getCO2eValue()) + "ppm";
        }
    }

    //处理数据
    function deal_with(value)
    {
        if(value == 999)
        {
            return "--"
        }
        else
        {
            return value
        }
    }
}
