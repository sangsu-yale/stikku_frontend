import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';

class WriteBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
    Get.lazyPut<DiaryDialogController>(() => DiaryDialogController());
  }
}

class DetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
    Get.lazyPut<DiaryDialogController>(() => DiaryDialogController());
  }
}
