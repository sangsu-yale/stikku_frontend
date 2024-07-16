import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stikku_frontend/controllers/isar_controller.dart';
import 'package:stikku_frontend/main_screen.dart';
import 'package:stikku_frontend/pages/details_page.dart';
import 'package:stikku_frontend/pages/diary_page.dart';
import 'package:stikku_frontend/pages/notfound_page.dart';
import 'package:stikku_frontend/pages/write_page.dart';
import 'package:stikku_frontend/services/isar_service.dart';

void main() async {
  // Binding 시스템 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  await IsarService().init(); // IsarService (로컬 DB) 초기화
  Get.put(IsarService()); // IsarService를 GetX 종속성으로 등록

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IsarController()); // OO님 반갑습니다.

    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "스티꾸 s t i k k u, 스포츠 티켓 꾸미기",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF378CE7),
          centerTitle: true,
        ),
        textTheme: const TextTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: const Color(0xFFE9EDF6),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF378CE7),
          primary: const Color(0xFF378CE7),
          onPrimary: const Color(0xFF378CE7),
          primaryContainer: const Color(0xFFE9EDF6),
          secondary: const Color(0xFFE7376C),
          surface: const Color(0xFFFBFAFA),
        ),
        scaffoldBackgroundColor: const Color(0xFFFBFAFA),
        useMaterial3: true,
        splashFactory: NoSplash.splashFactory, // Splash 효과를 제거
        highlightColor: Colors.transparent, // 강조 효과를 투명하게 설정
        splashColor: Colors.transparent, // Splash 색상을 투명하게 설정
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => MainScreen(),
        ),
        GetPage(
          name: '/write',
          page: () => WritePage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/diary',
          page: () => DiaryPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/details',
          page: () => DetailsPage(),
          transition: Transition.native,
        ),
      ],
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const NotfoundPage(),
      ),
      home: MainScreen(),
    );
  }
}
