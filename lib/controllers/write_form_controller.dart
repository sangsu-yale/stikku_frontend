import 'dart:typed_data';

import 'package:get/get.dart';

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
  // 날짜

  void validateForm() {
    // 간단한 유효성 검사
    isFormValid.value = title.value.isNotEmpty;
  }

  void setSelectedValue(bool value) {
    viewingMode.value = value;
  }

  void submit() {
    print(team1IsMyTeam.value);
  }
}

///     - 승패 유무
///     - 직관 유무
///     - 응원팀 체크
///     - 경기장
///     - 좌석
///     - 사진
///     - 경기 제목
///     - 한줄 코멘트