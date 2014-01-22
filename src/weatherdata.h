#ifndef WEATHERDATA_H
#define WEATHERDATA_H

#include <QObject>

class WeatherData : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString pressure READ pressure WRITE setPressure NOTIFY dataChanged)

public:
    explicit WeatherData(QObject *parent = 0);
    WeatherData(const WeatherData &other);

    QString pressure() const;

    void setPressure(const QString &value);
    void refreshData();

signals:
    void dataChanged();

private:
    QString m_pressure;
    static const QString APIKEY;
};

#endif // WEATHERDATA_H
