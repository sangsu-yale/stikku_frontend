import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

// 캘린더 날짜, FAB 버튼, 리스트뷰, 그리드뷰 (write는 사용 X)
Future<void> goToDetails(IsarService isarController, DateTime date) async {
  final gameResult = await isarController.getDetails(date);
  final gameReview = await gameResult.loadGameReview();
  Get.toNamed('/details',
      arguments: {"gameResult": gameResult, "gameReview": gameReview});
}

// 로컬 스토리지 진입
Future<Map<String, dynamic>> getLocalStorageIsLogin() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return {"isLogin": prefs.getBool('isLogin')};
}
