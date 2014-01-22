# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = poiju

CONFIG += sailfishapp

SOURCES += src/poiju.cpp \
    src/weatherdata.cpp

OTHER_FILES += qml/poiju.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/poiju.spec \
    rpm/poiju.yaml \
    poiju.desktop \
    qml/components/CurrentWeatherDelegate.qml \
    qml/components/CurrentWeatherDelegate2.qml \
    qml/components/CurrentWeatherModel.qml \
    qml/components/Constant.qml

HEADERS += \
    src/weatherdata.h \
    src/apikey.h

