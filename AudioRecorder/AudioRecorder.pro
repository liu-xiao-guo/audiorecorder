TEMPLATE = aux
TARGET = AudioRecorder

RESOURCES += AudioRecorder.qrc

QML_FILES += $$files(*.qml,true) \
					   $$files(*.js,true)

CONF_FILES +=  AudioRecorder.apparmor \
               AudioRecorder.desktop \
               AudioRecorder.png

OTHER_FILES += $${CONF_FILES} \
               $${QML_FILES}

#specify where the qml/js files are installed to
qml_files.path = /AudioRecorder
qml_files.files += $${QML_FILES}

#specify where the config files are installed to
config_files.path = /AudioRecorder
config_files.files += $${CONF_FILES}

INSTALLS+=config_files qml_files

