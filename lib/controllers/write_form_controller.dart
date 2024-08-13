import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stikku_frontend/constants/result_enum.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:path/path.dart' as path; // 여기서 패키지를 import

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

  var result = GameResultType.WIN.obs; // 승패유무
  void updateResult(GameResultType newResult) {
    result.value = newResult;
  }

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
  var date = DateTime.now().toUtc().obs;

  // arguments 처리
  void getGameResultFromArguments(
      GameResult gameResult, bool isEditMode) async {
    // 게임 결과가 있을 경우
    if (gameResult.result != null) {
      updateResult(gameResult.result!);
    }
    // 날짜 설정
    date.value = gameResult.date!;

    // 수정 모드
    if (isEditMode) {
      team1Con.text = gameResult.team1!;
      team2Con.text = gameResult.team2!;
      score1Con.text = gameResult.score1!;
      score2Con.text = gameResult.score2!;
      stadiumCon.text = gameResult.stadium!;
      seatLocationCon.text = gameResult.seatLocation!;
      viewingMode.value = gameResult.viewingMode; // 직관, 집관
      team1IsMyTeam.value = gameResult.team1IsMyTeam; // 응원팀
      team2IsMyTeam.value = gameResult.team1IsMyTeam; // 응원팀

      updateResult(gameResult.result!);

      commentCon.text = gameResult.comment ?? '';
      gameTitleCon.text = gameResult.gameTitle ?? '';

      // 사진
      // 만약에 사진이 있을 경우 (판별은 pictureLocalPath)
      if (gameResult.pictureLocalPath != null) {
        selectedImage.value = File(gameResult.pictureLocalPath!);
      }

      final gameReview = await gameResult.loadGameReview();

      if (gameReview != null) {
        rating.value = gameReview.rating ?? 0;
        mood.value = gameReview.mood ?? '';

        if (gameReview.review != null) {
          review.text = gameReview.review!;
        }
        if (gameReview.playerOfTheMatch != null) {
          playerOfTheMatch.text = gameReview.playerOfTheMatch!;
        }
        if (gameReview.food != null) {
          food.text = gameReview.food!;
        }
      }
    }
  }

  // 유효성 검사 (필수)
  // 폼 전송 함수
  void submit(isEditMode) async {
    final GameResult gameResult;

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
        "date": date.value,
        "stadium": stadiumCon.text,
        "seatLocation": seatLocationCon.text,
        "team1": team1Con.text,
        "team2": team2Con.text,
        "score1": score1Con.text,
        "score2": score2Con.text,
        "team1IsMyTeam": team1IsMyTeam.value,
        "team2IsMyTeam": team2IsMyTeam.value,
        "comment": commentCon.text,
        "pictureUrl": null,
        "isFavorite": false
      },
      // 옵션이기 때문에 null 처리
      "gameReview": {
        "review": review.text.isEmpty ? null : review.text,
        "rating": rating.value == 0 ? null : rating.value,
        "playerOfTheMatch":
            playerOfTheMatch.text.isEmpty ? null : playerOfTheMatch.text,
        "mood": mood.value == '' ? null : mood.value,
        "homeTeamLineup": null,
        "awayTeamLineup": null,
        "food": food.text.isEmpty ? null : food.text
      },
      "pictureLocalPath": selectedImage.value,
    };

    if (isEditMode) {
      gameResult = await isarController.updateSubmit(data);
    } else {
      gameResult = await isarController.postSubmit(data);
    }

    final gameReview = await gameResult.loadGameReview();

    // 리스트 업데이트
    listTopSearchController.loadGameResults();
    Get.toNamed('/details',
        arguments: {"gameResult": gameResult, "gameReview": gameReview});
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
      case 'food':
        return food;
      default:
        throw Exception('Unknown widget ID: $widgetId');
    }
  }

// <!-- 이미지 (어드밴스드) -->
  var selectedImage = Rx<File?>(null);

  // 이미지 픽
  Future<void> pickImage() async {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // selectedImage.value = File(pickedFile.path);

      final CroppedFile? croppedFilePath = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,

        aspectRatio: const CropAspectRatio(
            ratioX: 16, ratioY: 9), // Specify a default aspect ratio

        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '사진 편집',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            lockAspectRatio: true, // 비율고정
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ],
      );

      if (croppedFilePath != null) {
        final compressedImage = await compressImage(File(croppedFilePath.path));
        compressedImage != null
            ? selectedImage.value = File(compressedImage.path)
            : selectedImage.value = File(croppedFilePath.path);
      }
    }
  }

  // 이미지 삭제
  void deleteImage() {
    selectedImage.value = null;
  }
}

Future<File?> compressImage(File imageFile) async {
  try {
    // 임시 디렉토리 경로 가져오기
    final directory = await getApplicationDocumentsDirectory();
    final targetPath = path.join(
      directory.path,
      'compressed_${path.basename(imageFile.path)}',
    );

    // 이미지 압축 수행
    var result = await FlutterImageCompress.compressAndGetFile(
      imageFile.absolute.path, // 원본 이미지 파일 경로
      targetPath, // 결과를 저장할 경로
      quality: 80, // 압축 품질 (0-100)
    );

    // 압축 결과 반환
    return File(result!.path);
  } catch (e) {
    print('Error compressing image: $e');
    return null;
  }
}

  // 여기는 어드밴스드
  // var homeTeamLineup = [].obs;
  // var awayTeamLineup = [].obs;