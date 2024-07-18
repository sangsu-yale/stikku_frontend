import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/user_model.dart';
import 'package:stikku_frontend/config/isar_db.dart';

class FormController extends GetxController {
  final CalendarController calendarController = Get.find();
  final ListTopSearchController listTopSearchController = Get.find();

  // 로컬 DB 연동
  final Isar _isar;
  FormController() : _isar = Get.find<IsarDB>().isar;

  // 폼 리스트
  var userId = 0.obs; // 유저 아이디
  var title = ''.obs; // 경기 제목
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
  var review = ''.obs;
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
        stadium.value = '집관';
        seatLocation.value = '집관';
      }
    }
    return isValid;
  }

  // 폼 전송 함수
  void submit() async {
    final user =
        await _isar.users.where().findFirst(); // 임시로 1, 로컬 스토리지 참조하여 구함
    // GameResult 객체 생성 및 저장

    if (user != null) {
      final gameResult = GameResult()
        ..stadium = stadium.value
        ..seatLocation = seatLocation.value
        ..result = result.value
        ..viewingMode = viewingMode.value
        ..team1 = team1.value
        ..team2 = team2.value
        ..score1 = score1.value
        ..score2 = score2.value
        ..team1IsMyTeam = team1IsMyTeam.value
        ..team2IsMyTeam = team2IsMyTeam.value
        ..gameTitle = title.value
        ..comment = comment.value
        ..pictureUrl = ''
        ..date = date
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..reviewComment = review.value
        ..playerOfTheMatch = playerOfTheMatch.value
        ..food = food.value
        ..user.value = user;

      // Event 객체 생성 및 필요한 필드를 설정합니다.
      final event = Event()
        ..eventDate = date
        ..eventDetails = [result.value]; // 경기 결과를 이벤트 디테일로 저장

      // 트랜잭션을 사용하여 GameResult와 Event를 데이터베이스에 저장하고, User와의 관계를 설정합니다.
      await _isar.writeTxn(() async {
        // GameResult 저장
        await _isar.gameResults.put(gameResult);
        user.gameResults.add(gameResult);

        // Event 저장
        await _isar.events.put(event);
        user.events.add(event);

        // 관계 저장
        await user.gameResults.save();
        await user.events.save();
      });

      // 모든 GameResult를 로드하고 출력합니다.
      await user.gameResults.load();
      await user.events.load();

      // 리스트 업데이트
      listTopSearchController.loadGameResults();
      Get.toNamed('/details', arguments: gameResult);
    }
  }
}



    // for (var result in user.events) {
    //   print('이벤트 데이트: ${result.eventDate}');
    //   print('이벤트 디테일: ${result.eventDetails}');
    //   print('-----------------------------');
    // }

    // for (var result in user.gameResults) {
    //   print(
    //       'Game Title: ${result.gameTitle}, Score: ${result.score1} - ${result.score2}');
    //   print('Stadium: ${result.stadium}, Seat: ${result.seatLocation}');
    //   print('Teams: ${result.team1} vs ${result.team2}');
    //   print('Result: ${result.result}, Viewing Mode: ${result.viewingMode}');
    //   print('Comment: ${result.comment}');
    //   print('Date: ${result.date}');
    //   print('Picture URL: ${result.pictureUrl}');
    //   print('Created At: ${result.createdAt}, Updated At: ${result.updatedAt}');
    //   print('-----------------------------');
    // }

    // print(user.username);
    // print(user.id);
