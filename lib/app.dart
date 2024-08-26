import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/pages/main/main_screen.dart';
import 'package:stikku_frontend/config/routes.dart';
import 'package:stikku_frontend/config/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // 상태바 아이콘 밝기
    ));
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      title: "스티다 | 스포츠 티켓 다이어리",
      theme: appTheme(context),
      initialRoute: '/',
      getPages: appRoutes,
      home: MainScreen(),
    );
  }
}
