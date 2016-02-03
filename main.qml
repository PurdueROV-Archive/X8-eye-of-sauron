import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Dialogs 1.2
import QtMultimedia 5.4

Window {
    property string rovName: "X8"
    property string cerulean: "#6D9BC3"
    property string teal:     "#00BCD4"
    property string amber:    "#FFC107"
    property string mainColor: "#455A64"
    property string mainAccent: amber

    id: mainWindow
    visible: true
    width: 1920
    height: 1010
    visibility: "Maximized"
    //color: "#151515"
    color:"white"
    title: "Purdue IEEE | ROV " + rovName
    objectName: "mainWindow"


    Rectangle {
        id: actionBar
        height: 60
        width: mainWindow.width
        color: mainColor

        Text {
            x: 20
            height: actionBar.height
            font.pixelSize: 30

            color: "white"
            verticalAlignment: Text.AlignVCenter

            text: "Purdue IEEE | Camera View Application : S.O.N.A.R."
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: actionBar.bottom
            height: 20
            gradient: Gradient {
                 GradientStop { position: 0.0; color: "#33000000" }
                 GradientStop { position: 1.0; color: "#00000000" }
             }
        }
    }
    Rectangle {
        id: database
        height: 500
        width: mainWindow.width
        anchors.top: actionBar.bottom
        color: "#151515"

        Video {
            id:video1
            anchors.fill: parent
            source: "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_30mb.mp4"
            autoPlay: true
        }



        Item {
            width: 320;  height:540

            DropArea {
                x:0; y:350
                width:150; height:150

                Rectangle {
                    anchors.fill: parent

                    visible: parent.containsDrag
                }

            }

            Rectangle {
                x:0; y:350
                width:150; height:150
                color:"darkgreen"

                Drag.active: dragArea.drag.active
                Drag.hotSpot.x: 0
                Drag.hotSpot.y: 350

                MouseArea {
                    id: dragArea
                    anchors.fill: parent
                    drag.target: parent

                    onClicked: {
                        video1.stop()
                        video2.stop()
                        var source2 = video1.source
                        video1.source = video2.source
                        video2.source = source2
                        video1.play()
                        video2.play()
                    }


                }
                Video {
                    id:video2
                    anchors.fill:parent
                    source: "http://techslides.com/demos/sample-videos/small.mp4"
                    autoPlay: true
                }
            }
        }

        Item {
            width: 320;  height:540

            DropArea {
                x:170; y:350
                width:150; height:150

                Rectangle {
                    anchors.fill: parent

                    visible: parent.containsDrag
                }

            }

            Rectangle {
                x:170; y:350
                width:150; height:150
                color:"darkgreen"

                Drag.active: dragArea2.drag.active
                Drag.hotSpot.x: 170
                Drag.hotSpot.y: 350

                MouseArea {
                    id: dragArea2
                    anchors.fill: parent
                    drag.target: parent
                    onClicked: {
                        video1.stop()
                        video3.stop()
                        var source1 = video1.source
                        video1.source = video3.source
                        video3.source = source1
                        video1.play()
                        video3.play()


                    }
                }
                Video {
                    id:video3
                    anchors.fill:parent
                    source: "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_30mb.mp4"
                    autoPlay: true
                }
            }
        }

        Rectangle {
            id: helloText
            x: 0
            width:mainWindow.width
            anchors.top: database.bottom
            height: 120
            anchors.margins: 5
            color:"black"
            anchors.topMargin: 1

            //Row {
                //id:row1
                //spacing: 100

                Rectangle {
                    id: textInputBox1
                    width: 600
                    height: 30
                    anchors.top:parent.top
                    anchors.bottom: textInputBox2
                    anchors.left: parent.left
                    anchors.leftMargin: 100
                    anchors.topMargin: 10
                    color: "white"

                    TextInput {
                        id: textinput1
                        anchors.fill: parent
                        text: "Camera1: http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_30mb.mp4"
                        color: "black"
                        selectByMouse: true
                        clip:true
                        focus: true
                    }
                }
            //}

            //Row {
                //id:row2
                //spacing: 100

                Rectangle {
                    id: textInputBox2
                    width: 600
                    height: 30
                    color:"white"
                    anchors.top: textInputBox1.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 100

                    TextInput {
                        id: textinput2
                        anchors.fill: parent
                        text:"Camera2: http://techslides.com/demos/sample-videos/small.mp4"
                        color: "black"
                        selectByMouse: true
                        clip: true
                        focus: true
                    }

                }
            //}

            //Row {
                //id: row3
                //spacing: 100

                Rectangle {
                    id: textInputBox3
                    width: 600
                    height: 30
                    color:"white"
                    anchors.top: textInputBox2.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 100

                    TextInput {
                        id: textinput3
                        anchors.fill: parent
                        text: "Camera3: http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_30mb.mp4"
                        anchors.topMargin: 8
                        color: "black"
                        selectByMouse: true
                        clip: true
                        focus: true
                    }

                }
            //}
        }


    }
    }





