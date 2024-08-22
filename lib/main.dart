import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stikku_frontend/app.dart';
import 'package:stikku_frontend/config/isar_db.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 앱 초기화만 집중
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  await dotenv.load();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Release 모드에서는 비활성화 (테스트 모드에서만 활성화)
      builder: (context) => const MyApp(), // MyApp은 여러분의 기존 앱 위젯입니다.
    ),
  );
}

// 앱 초기화 함수
Future<void> _initializeApp() async {
  await initializeDateFormatting(); // Date 로컬라이징
  await IsarDB().init(); // IsarDB (로컬 DB) 초기화
  Get.put(IsarDB()); // IsarDB를 GetX 종속성으로 등록
  Get.put(IsarService()); // OO님 반갑습니다.
}
