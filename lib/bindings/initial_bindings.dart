import 'package:get/get.dart';
import 'package:stikku_frontend/services/isar_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    final isarService = IsarService();
    await isarService.init();
    Get.put<IsarService>(isarService, permanent: true);
  }
}
