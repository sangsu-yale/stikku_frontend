import 'package:flutter/material.dart';

// 동적 정의
ThemeData appTheme(BuildContext context) {
  return ThemeData(
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
  );
}
