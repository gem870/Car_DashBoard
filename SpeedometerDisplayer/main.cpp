#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "meterdiplayer.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterType<MeterDiplayer>("Meter_D", 1,2,"Meter_D");

    MeterDiplayer m_parameters;





    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);
    QQmlContext *context(engine.rootContext());
    context->setContextProperty("m_parameters", &m_parameters);


    return app.exec();
}
