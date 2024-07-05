import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/main_screen.dart';
import 'package:stikku_frontend/pages/details_page.dart';
import 'package:stikku_frontend/pages/diary_page.dart';
import 'package:stikku_frontend/pages/notfound_page.dart';
import 'package:stikku_frontend/pages/write_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "스티꾸 s t i k k u, 스포츠 티켓 꾸미기",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF378CE7),
          centerTitle: true,
        ),
        textTheme: const TextTheme(),
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
          page: () => const WritePage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/diary',
          page: () => const DiaryPage(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/details',
          page: () => const DetailsPage(),
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
