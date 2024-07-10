import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FormController extends GetxController {
  var userId = 0.obs; // 유저 아이디
  var title = ''.obs; // 경기 제목
  var stadium = ''.obs; // 경기장
  var seatLocation = ''.obs; // 좌석
  var result = ''.obs; // 경기 결과
  var viewingMode = false.obs; // 직관, 집관
  var team1 = ''.obs;
  var team2 = ''.obs;
  var score1 = ''.obs;
  var score2 = ''.obs;
  var team1IsMyTeam = false.obs;
  var team2IsMyTeam = false.obs;
  var comment = ''.obs;
  var isFormValid = false.obs;
  var image = ByteData(8).obs;
  var emailError = ''.obs;
  // 날짜
  var selectedImage = Rx<File?>(null);

  // 유효성 검사 (필수)
  bool validate() {
    // 필요한 유효성 검사 : 점수 2, 팀 이름 2, 경기장, 좌석
    bool isValid = false;

    // 직관일 경우
    if (viewingMode.value) {
      // 전체 검사
      if (team1.value.isNotEmpty ||
          team2.value.isNotEmpty ||
          score1.value.isNotEmpty ||
          score2.value.isNotEmpty ||
          stadium.value.isNotEmpty ||
          seatLocation.value.isNotEmpty) {
        isValid = true;
      }
    } // 집관일 경우
    else {
      // 경기장, 좌석은 직접 채움
      if (team1.value.isNotEmpty ||
          team2.value.isNotEmpty ||
          score1.value.isNotEmpty ||
          score2.value.isNotEmpty) {
        isValid = true;
        stadium.value = '집관입니다';
        seatLocation.value = '집관입니다';
      }
    }
    return isValid;
  }

  void setSelectedValue(bool value) {
    viewingMode.value = value;
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  void deleteImage() {
    selectedImage.value = null;
  }

  void submit() {
    Get.toNamed('/details');
  }
}
