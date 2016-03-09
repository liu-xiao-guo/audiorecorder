import QtQuick 2.0
import Ubuntu.Components 1.1
import QtMultimedia 5.0
import AudioRecorder 1.0

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "audiorecorder.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("AudioRecorder")

        AudioRecorder {
            id: audio
            name: "sample.wav"

            onRecordingChanged: {
                console.log("recording: " + recording);
            }
        }

        MediaPlayer {
            id: player
            autoPlay: true
            volume: 1.0
        }

        Column {
            anchors.fill: parent
            spacing: units.gu(1)

            Label {
                text: "Supported Audio codecs:"
            }
            ListView {
                id: audiocodecs
                width: parent.width
                height: audiocodecs.contentHeight
                model:audio.supportedAudioCodecs()
                delegate: Text {
                    text: modelData
                }
            }

            Rectangle {
                width: parent.width
                height: units.gu(0.1)
            }

            Label {
                text: "Supported Containers:"
            }
            ListView {
                id: audiocontainer
                width: parent.width
                height: audiocontainer.contentHeight
                model:audio.supportedContainers()
                delegate: Text {
                    text: modelData
                }
            }
        }

        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: units.gu(2)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: units.gu(2)

            spacing: units.gu(2)

            Button {
                id: record
                text: "Record Audio"

                enabled: !audio.recording

                onClicked: {
                    audio.record();
                }
            }

            Button {
                id: stop
                text: "Stop"

                onClicked: {
                    audio.stop();
                    player.stop();
                }
            }

            Button {
                id: play
                text: "Play Audio"

                onClicked: {
                    console.log("path: " + audio.path() );
                    player.source = audio.path();
                    player.play();
                }
            }

        }
    }
}

