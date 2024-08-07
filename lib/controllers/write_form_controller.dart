import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class FormController extends GetxController {
  final CalendarController calendarController = Get.find();
  final isarController = Get.find<IsarService>();
  final ListTopSearchController listTopSearchController = Get.find();
  final focusScopeNode = FocusScopeNode();

  var currentFormIndex = 0.obs;

  get name => null;
  void changeForm(int index) {
    currentFormIndex.value = index;
  }

  @override
  void onClose() {
    team1Con.dispose();
    team2Con.dispose();
    score1Con.dispose();
    score2Con.dispose();
    team1IsMyTeamCon.dispose();
    team2IsMyTeamCon.dispose();
    seatLocationCon.dispose();
    stadiumCon.dispose();
    gameTitleCon.dispose();
    commentCon.dispose();
    review.dispose();
    food.dispose();
    playerOfTheMatch.dispose();
    focusScopeNode.unfocus();
    super.onClose();
  }

  void unfocus() {
    focusScopeNode.unfocus();
  }

  // <---------- 게임 결과 컨트롤러 ---------->
  final team1Con = TextEditingController();
  final team2Con = TextEditingController();
  final score1Con = TextEditingController();
  final score2Con = TextEditingController();
  final team1IsMyTeamCon = TextEditingController();
  final team2IsMyTeamCon = TextEditingController();
  final seatLocationCon = TextEditingController();
  final stadiumCon = TextEditingController();
  final gameTitleCon = TextEditingController();
  final commentCon = TextEditingController();

  var result = ''.obs; // 승패유무
  var userId = 0.obs; // 유저 아이디
  var viewingMode = false.obs; // 직관, 집관
  var team1IsMyTeam = false.obs; // 응원팀
  var team2IsMyTeam = false.obs; // 응원팀

  // <---------- 게임 리뷰 컨트롤러 ---------->
  var review = TextEditingController();
  var food = TextEditingController();
  var playerOfTheMatch = TextEditingController();
  var rating = 0.obs;
  var mood = ''.obs;

  // 폼에 필요한 함수 정리
  void setSelectedValue(bool value) => viewingMode.value = value;
  void setRating(int value) => rating.value = value;
  void setMood(String value) => mood.value = value;

  // <!-- 유효성 시작 -->
  var isFormValid = false.obs;
  var date = DateTime.now().toUtc();

  // 유효성 검사 (필수)
  // 폼 전송 함수
  void submit(isEditMode) async {
    if (score1Con.text == "") score1Con.text = "0";
    if (score2Con.text == "") score2Con.text = "0";
    if (!viewingMode.value) {
      stadiumCon.text = "집관";
      seatLocationCon.text = "집관";
    }

    Map data = {
      "gameResult": {
        "userId": 0,
        "result": result.value,
        "isLiveView": viewingMode.value,
        "title": gameTitleCon.text,
        "date": date,
        "stadium": stadiumCon.text,
        "seatLocation": seatLocationCon.text,
        "team1": team1Con.text,
        "team2": team2Con.text,
        "score1": score1Con.text,
        "score2": score2Con.text,
        "team1IsMyTeam": team1IsMyTeam.value,
        "team2IsMyTeam": team2IsMyTeam.value,
        "comment": commentCon.text,
        "picture": '',
        "isFavorite": false
      },
      "gameReview": {
        "review": review.text,
        "rating": rating.value,
        "playerOfTheMatch": playerOfTheMatch.text,
        "mood": mood.value,
        "homeTeamLineup": [''],
        "awayTeamLineup": [''],
        "food": food.text
      }
    };

    final GameResult gameResult;
    if (isEditMode) {
      gameResult = await isarController.updateSubmit(data);
    } else {
      gameResult = await isarController.postSubmit(data);
    }

    //

    // 리스트 업데이트
    listTopSearchController.loadGameResults();
    Get.toNamed('/details', arguments: gameResult);
  }

  void deleteDetails(DateTime date) async {
    await isarController.deleteSubmit(date);
    listTopSearchController.loadGameResults();
    Get.toNamed('/');
  }

  // 위젯 ID에 따라 적절한 TextEditingController를 반환합니다.
  TextEditingController getTextController(String widgetId) {
    switch (widgetId) {
      case 'review':
        return review;
      case 'playerOfTheMatch':
        return playerOfTheMatch;
      case 'mood':
        // mood는 TextEditingController가 아닌 RxString으로 관리됩니다.
        throw Exception('Mood is not managed with TextEditingController.');
      case 'food':
        return food;
      default:
        throw Exception('Unknown widget ID: $widgetId');
    }
  }

// <!-- 이미지 (어드밴스드) -->
  // 이미지 픽
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // selectedImage.value = File(pickedFile.path);
    }
  }

  var image = ByteData(8).obs;
  var selectedImage = Rx<File?>(null);

  // 이미지 삭제
  void deleteImage() {
    // selectedImage.value = null;
  }
}

  // 여기는 어드밴스드
  // var homeTeamLineup = [].obs;
  // var awayTeamLineup = [].obs;