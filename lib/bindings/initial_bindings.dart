import 'package:get/get.dart';
import 'package:stikku_frontend/services/isar_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    // IsarService 초기화
    final isarService = IsarService();
    await isarService.init();

    // 모든 유저 데이터 출력
    await isarService.printAllUsers();

    // GetX의 의존성 관리 시스템에 IsarService 인스턴스를 등록
    Get.put<IsarService>(isarService, permanent: true);
  }
}
