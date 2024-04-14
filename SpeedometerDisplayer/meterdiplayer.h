#ifndef METERDIPLAYER_H
#define METERDIPLAYER_H

#include <QObject>
#include <QQuickPaintedItem>

class MeterDiplayer : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(qreal rpmMeter READ rpmMeter WRITE setRpmMeter NOTIFY rpmMeterChanged)
    Q_PROPERTY(qreal tyreDiameter READ tyreDiameter WRITE setTyreDiameter NOTIFY tyreDiameterChanged)
    Q_PROPERTY(qreal firstGearRatio READ firstGearRatio WRITE setFirstGearRatio NOTIFY firstGearRatioChanged)
    Q_PROPERTY(qreal secondGearRatio READ secondGearRatio WRITE setSecondGearRatio NOTIFY secondGearRatioChanged)
    Q_PROPERTY(qreal thirdGearRatio READ thirdGearRatio WRITE setThirdGearRatio NOTIFY thirdGearRatioChanged)
    Q_PROPERTY(qreal fourthGearRation READ fourthGearRation WRITE setFourthGearRation NOTIFY fourthGearRationChanged)
    Q_PROPERTY(qreal fifthGearRatio READ fifthGearRatio WRITE setFifthGearRatio NOTIFY fifthGearRatioChanged)
    Q_PROPERTY(qreal sixthGearRatio READ sixthGearRatio WRITE setSixthGearRatio NOTIFY sixthGearRatioChanged)
    Q_PROPERTY(qreal engineTemp READ engineTemp WRITE setEngineTemp NOTIFY engineTempChanged)
    Q_PROPERTY(qreal fuelGuage READ fuelGuage WRITE setFuelGuage NOTIFY fuelGuageChanged)
    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(qreal driveRatio READ driveRatio WRITE setDriveRatio NOTIFY driveRatioChanged)
    Q_PROPERTY(bool isAccelerating READ isAccelerating WRITE setIsAccelerating NOTIFY isAcceleratingChanged)
    Q_PROPERTY(qreal rpmValueChange READ rpmValueChange WRITE setRpmValueChange NOTIFY rpmValueChangeChanged)



public:
    explicit MeterDiplayer(QQuickPaintedItem *parent = nullptr);
    virtual void paint(QPainter *painter);

    Q_INVOKABLE void updateEngine();


    qreal rpmMeter() const;
    void setRpmMeter(qreal newRpmMeter);

    qreal tyreDiameter() const;
    void setTyreDiameter(qreal newTyreDiameter);

    qreal firstGearRatio() const;
    void setFirstGearRatio(qreal newFirstGearRatio);

    qreal secondGearRatio() const;
    void setSecondGearRatio(qreal newSecondGearRatio);

    qreal thirdGearRatio() const;
    void setThirdGearRatio(qreal newThirdGearRatio);

    qreal fourthGearRation() const;
    void setFourthGearRation(qreal newFourthGearRation);

    qreal fifthGearRatio() const;
    void setFifthGearRatio(qreal newFifthGearRatio);

    qreal sixthGearRatio() const;
    void setSixthGearRatio(qreal newSixthGearRatio);


    qreal engineTemp() const;
    void setEngineTemp(qreal newEngineTemp);

    qreal fuelGuage() const;
    void setFuelGuage(qreal newFuelGuage);


    qreal speed() const;
    void setSpeed(qreal newSpeed);

    qreal driveRatio() const;
    void setDriveRatio(qreal newDriveRatio);

    bool isAccelerating() const;
    void setIsAccelerating(bool newIsAccelerating);


    qreal rpmValueChange() const;
    void setRpmValueChange(qreal newRpmValueChange);

signals:
    void rpmMeterChanged();
    void tyreDiameterChanged();

    void firstGearRatioChanged();

    void secondGearRatioChanged();

    void thirdGearRatioChanged();

    void fourthGearRationChanged();

    void fifthGearRatioChanged();

    void sixthGearRatioChanged();


    void engineTempChanged();

    void fuelGuageChanged();


    void speedChanged();

    void driveRatioChanged();

    void isAcceleratingChanged();


    void rpmValueChangeChanged();

private:
    qreal m_rpmMeter;
    qreal m_tyreDiameter;
    qreal m_firstGearRatio;
    qreal m_secondGearRatio;
    qreal m_thirdGearRatio;
    qreal m_fourthGearRation;
    qreal m_fifthGearRatio;
    qreal m_sixthGearRatio;
    qreal m_engineTemp;
    qreal m_fuelGuage;
    bool m_brakeing;
    bool m_accelerating;
    qreal m_speed;
    qreal m_driveRatio;
    bool m_isAccelerating;
    qreal m_rpmValueChange;
};

#endif // METERDIPLAYER_H
