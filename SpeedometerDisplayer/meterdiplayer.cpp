#include "meterdiplayer.h"
#include <QDebug>
#include <QTimer>

MeterDiplayer::MeterDiplayer(QQuickPaintedItem *parent)
    : QQuickPaintedItem{parent}
    , m_rpmMeter(5000)
    , m_tyreDiameter(680)
    , m_firstGearRatio(2.7)
    , m_secondGearRatio(2.1)
    , m_thirdGearRatio(1.5)
    , m_fourthGearRation(1.0)
    , m_fifthGearRatio(0.85)
    , m_sixthGearRatio(0.6)
    , m_engineTemp(0.0)
    , m_fuelGuage(60)
    , m_speed(180)
    , m_driveRatio(3.4)
    , m_isAccelerating(false)
{


    QTimer *timer2 = new QTimer(this);
    connect(timer2, &QTimer::timeout, this, QOverload<>::of(&MeterDiplayer::updateEngine));
    timer2->start(100);


}

void MeterDiplayer::paint(QPainter *painter)
{

}




void MeterDiplayer::updateEngine()
{


    if(m_isAccelerating == true){
        m_engineTemp += 0.1;
        emit engineTempChanged();
        m_fuelGuage -= 0.1;
        emit fuelGuageChanged();
        setRpmValueChange( m_rpmValueChange + 100);

    }
    else{
        m_engineTemp -= 0.1;
        emit engineTempChanged();
        setRpmValueChange( m_rpmValueChange - 100);
    }


    // m_speed = 3.6 * m_rpmMeter * 3.14 * (m_tyreDiameter/(2 * 1000)) / (30 * m_firstGearRatio * m_driveRatio);


}

qreal MeterDiplayer::rpmMeter() const
{
    return m_rpmMeter;
}

void MeterDiplayer::setRpmMeter(qreal newRpmMeter)
{
    if (qFuzzyCompare(m_rpmMeter, newRpmMeter))
        return;
    m_rpmMeter = newRpmMeter;
    emit rpmMeterChanged();
}

qreal MeterDiplayer::tyreDiameter() const
{
    return m_tyreDiameter;
}

void MeterDiplayer::setTyreDiameter(qreal newTyreDiameter)
{
    if (qFuzzyCompare(m_tyreDiameter, newTyreDiameter))
        return;
    m_tyreDiameter = newTyreDiameter;
    emit tyreDiameterChanged();
}

qreal MeterDiplayer::firstGearRatio() const
{
    return m_firstGearRatio;
}

void MeterDiplayer::setFirstGearRatio(qreal newFirstGearRatio)
{
    if (qFuzzyCompare(m_firstGearRatio, newFirstGearRatio))
        return;
    m_firstGearRatio = newFirstGearRatio;
    emit firstGearRatioChanged();
}

qreal MeterDiplayer::secondGearRatio() const
{
    return m_secondGearRatio;
}

void MeterDiplayer::setSecondGearRatio(qreal newSecondGearRatio)
{
    if (qFuzzyCompare(m_secondGearRatio, newSecondGearRatio))
        return;
    m_secondGearRatio = newSecondGearRatio;
    emit secondGearRatioChanged();
}

qreal MeterDiplayer::thirdGearRatio() const
{
    return m_thirdGearRatio;
}

void MeterDiplayer::setThirdGearRatio(qreal newThirdGearRatio)
{
    if (qFuzzyCompare(m_thirdGearRatio, newThirdGearRatio))
        return;
    m_thirdGearRatio = newThirdGearRatio;
    emit thirdGearRatioChanged();
}

qreal MeterDiplayer::fourthGearRation() const
{
    return m_fourthGearRation;
}

void MeterDiplayer::setFourthGearRation(qreal newFourthGearRation)
{
    if (qFuzzyCompare(m_fourthGearRation, newFourthGearRation))
        return;
    m_fourthGearRation = newFourthGearRation;
    emit fourthGearRationChanged();
}

qreal MeterDiplayer::fifthGearRatio() const
{
    return m_fifthGearRatio;
}

void MeterDiplayer::setFifthGearRatio(qreal newFifthGearRatio)
{
    if (qFuzzyCompare(m_fifthGearRatio, newFifthGearRatio))
        return;
    m_fifthGearRatio = newFifthGearRatio;
    emit fifthGearRatioChanged();
}

qreal MeterDiplayer::sixthGearRatio() const
{
    return m_sixthGearRatio;
}

void MeterDiplayer::setSixthGearRatio(qreal newSixthGearRatio)
{
    if (qFuzzyCompare(m_sixthGearRatio, newSixthGearRatio))
        return;
    m_sixthGearRatio = newSixthGearRatio;
    emit sixthGearRatioChanged();
}

qreal MeterDiplayer::engineTemp() const
{
    return m_engineTemp;
}

void MeterDiplayer::setEngineTemp(qreal newEngineTemp)
{

    if(newEngineTemp <= 100 && newEngineTemp >= 0)
        newEngineTemp = newEngineTemp;

    if (qFuzzyCompare(m_engineTemp, newEngineTemp))
        return;
    m_engineTemp = newEngineTemp;
    emit engineTempChanged();
}

qreal MeterDiplayer::fuelGuage() const
{
    return m_fuelGuage;
}

void MeterDiplayer::setFuelGuage(qreal newFuelGuage)
{
    if(newFuelGuage <= 100 && newFuelGuage >= 0)
        newFuelGuage = newFuelGuage;

    if (qFuzzyCompare(m_fuelGuage, newFuelGuage))
        return;
    m_fuelGuage = newFuelGuage;
    emit fuelGuageChanged();
}


qreal MeterDiplayer::speed() const
{
    return m_speed;
}

void MeterDiplayer::setSpeed(qreal newSpeed)
{

    if (qFuzzyCompare(m_speed, newSpeed))
        return;
    m_speed = newSpeed;
    emit speedChanged();
}


qreal MeterDiplayer::driveRatio() const
{
    return m_driveRatio;
}

void MeterDiplayer::setDriveRatio(qreal newDriveRatio)
{
    if (qFuzzyCompare(m_driveRatio, newDriveRatio))
        return;
    m_driveRatio = newDriveRatio;
    emit driveRatioChanged();
}


bool MeterDiplayer::isAccelerating() const
{
    return m_isAccelerating;
}

void MeterDiplayer::setIsAccelerating(bool newIsAccelerating)
{

    if (m_isAccelerating == newIsAccelerating)
        return;
    m_isAccelerating = newIsAccelerating;
    emit isAcceleratingChanged();
}




qreal MeterDiplayer::rpmValueChange() const
{
    return m_rpmValueChange;
}

void MeterDiplayer::setRpmValueChange(qreal newRpmValueChange)
{
    if (qFuzzyCompare(m_rpmValueChange, newRpmValueChange))
        return;
    m_rpmValueChange = newRpmValueChange;
    emit rpmValueChangeChanged();
}
