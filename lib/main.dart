import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stikku_frontend/app.dart';
import 'package:stikku_frontend/config/isar_db.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

// 앱 초기화만 집중
void main() async {
  await _initializeApp();

  runApp(DevicePreview(
    // 디바이스 프리뷰
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

// 앱 초기화 함수
Future<void> _initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting(); // Date 로컬라이징
  await IsarDB().init(); // IsarDB (로컬 DB) 초기화
  Get.put(IsarDB()); // IsarDB를 GetX 종속성으로 등록
  Get.put(IsarService()); // OO님 반갑습니다.
}
