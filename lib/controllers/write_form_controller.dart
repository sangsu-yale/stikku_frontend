import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class FormController extends GetxController {
  final CalendarController calendarController = Get.find();
  final isarController = Get.find<IsarService>();

  // 폼 리스트
  var userId = 0.obs; // 유저 아이디
  var gameTitle = ''.obs; // 경기 제목
  var stadium = ''.obs; // 경기장
  var seatLocation = ''.obs; // 좌석
  var result = ''.obs; // 경기 결과
  var viewingMode = false.obs; // 직관, 집관
  var team1 = ''.obs;
  var team2 = ''.obs;
  var score1 = '0'.obs;
  var score2 = '0'.obs;
  var team1IsMyTeam = false.obs;
  var team2IsMyTeam = false.obs;
  var comment = ''.obs;
  var isFormValid = false.obs;
  var image = ByteData(8).obs;
  var emailError = ''.obs;
  var selectedImage = Rx<File?>(null);
  var date = DateTime.now().toUtc();

  // game reviews
  var reviewComment = ''.obs;
  var rating = 0.obs;
  var playerOfTheMatch = ''.obs;
  var mood = ''.obs;
  var homeTeamLineup = [].obs;
  var awayTeamLineup = [].obs;
  var food = ''.obs;

  // 뷰잉 모드 집/직관
  void setSelectedValue(bool value) {
    viewingMode.value = value;
  }

  // 이미지 픽
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    print(pickedFile);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  // 이미지 삭제
  void deleteImage() {
    selectedImage.value = null;
  }

  // 유효성 검사 (필수)
  bool validate() {
    // 필요한 유효성 검사 : 점수 2, 팀 이름 2, 경기장, 좌석
    bool isValid = false;
    // 직관일 경우
    if (viewingMode.value) {
      // 전체 검사
      if (team1.value.isNotEmpty &&
          team2.value.isNotEmpty &&
          score1.value.isNotEmpty &&
          score2.value.isNotEmpty &&
          stadium.value.isNotEmpty &&
          seatLocation.value.isNotEmpty) {
        isValid = true;
      }
    } // 집관일 경우
    else {
      // 경기장, 좌석은 직접 채움
      if (team1.value.isNotEmpty &&
          team2.value.isNotEmpty &&
          score1.value.isNotEmpty &&
          score2.value.isNotEmpty) {
        isValid = true;
        stadium.value = '집관';
        seatLocation.value = '집관';
      }
    }
    return isValid;
  }

  // 폼 전송 함수
  void submit() async {
    Map data = {
      "stadium": stadium,
      "seatLocation": seatLocation,
      "result": result,
      "viewingMode": viewingMode,
      "team1": team1,
      "team2": team2,
      "score1": score1,
      "score2": score2,
      "team1IsMyTeam": team1IsMyTeam,
      "team2IsMyTeam": team2IsMyTeam,
      "gameTitle": gameTitle,
      "comment": comment,
      "date": date,
      "reviewComment": reviewComment,
      "playerOfTheMatch": playerOfTheMatch,
      "food": food
    };
    //
    final gameResult = await isarController.postSubmit(data);

    Get.toNamed('/details', arguments: gameResult);
  }
}
