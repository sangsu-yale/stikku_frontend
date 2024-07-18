import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/pages/main/main_screen.dart';
import 'package:stikku_frontend/pages/notfound_page.dart';
import 'package:stikku_frontend/config/routes.dart';
import 'package:stikku_frontend/config/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "스티꾸 s t i k k u, 스포츠 티켓 꾸미기",
      theme: appTheme(context),
      initialRoute: '/',
      getPages: appRoutes,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const NotfoundPage(),
      ),
      home: MainScreen(),
    );
  }
}
