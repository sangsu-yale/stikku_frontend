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
    bool isValid = true;

    if (team1.value.isEmpty ||
        team2.value.isEmpty ||
        score1.value.isEmpty ||
        score2.value.isEmpty ||
        stadium.value.isEmpty ||
        seatLocation.value.isEmpty) {
      isValid = false;
    }
    print(isValid);
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
    // print(team1IsMyTeam.value);
    // print(team2IsMyTeam.value);
    // print(team2.value);
    // print(team1.value);
  }
}
