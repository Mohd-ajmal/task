import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter/material.dart';
import 'package:task/database/mail_db.dart';
import 'package:task/database/model/email_model.dart';
import 'package:task/repository/mail_repo.dart';

import 'routes/routes.dart';
import 'themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilize();
  runApp(const MyApp());
}

initilize() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      autoStartOnBoot: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
    ),
  );
  service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(minutes: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {}
    }

    /// you can see this log in logcat
    print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
    DateTime now = DateTime.now();
    List<MailTable> data = await MailDb.instance.readAllEmployee() ?? [];

    if (data.isEmpty) {
      log("Values is not available");
      return;
    }
    for (int i = 0; i < data.length; i++) {
      log("${now.day.toInt()}-${now.month.toInt()}-${now.year.toInt()} ${now.hour.toInt()}:${now.minute.toInt()}\n");

      if (data[i].dateTime ==
          "${now.day.toInt()}-${now.month.toInt()}-${now.year.toInt()} ${now.hour.toInt()}:${now.minute.toInt()}") {
        log("Mail is going");
        MailRepository.getRepositoryResponse(
            name: "Ajmal", message: data[i].desc, subject: data[i].status);
      }
    }

    // test using external plugin

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": "Android",
      },
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: RouteManager.initialRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => RouteManager.generateRoute(settings),
    );
  }
}
// flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi