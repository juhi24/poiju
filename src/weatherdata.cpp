#include "weatherdata.h"
#include "apikey.h"

WeatherData::WeatherData(QObject *parent) :
        QObject(parent) {
}

WeatherData::WeatherData(const WeatherData &other) :
    QObject(0),
    m_pressure(other.m_pressure) {
}

QString WeatherData::pressure() const {
    return m_pressure;
}

void WeatherData::setPressure(const QString &value) {
    m_pressure = value;
    emit dataChanged();
}

void WeatherData::refreshData() {

}
