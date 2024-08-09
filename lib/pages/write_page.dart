import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
// import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/widgets/write/diary_form.dart';
import 'package:stikku_frontend/widgets/write/game_result_form.dart';

part '../widgets/write/parts/appbar.dart';
part '../widgets/write/parts/bottom_button_bar.dart';
part '../widgets/write/parts/form_screens.dart';

class WritePage extends StatelessWidget {
  final formController = Get.find<FormController>();
  final diaryDialogController = Get.put(DiaryDialogController());

  final formKey = GlobalKey<FormState>();

  final bool isEditMode;

  WritePage({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    // final GameResult gameResult = Get.arguments ?? GameResult;

    // 컨트롤러에 arguments 주입
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 여기에 setState 또는 초기화 코드를 작성하세요.
      // if (daynResult.isNotEmpty) {
      //   formController.result.value = daynResult["result"] ?? '';
      //   formController.date = daynResult["day"] ?? DateTime.now().toUtc();
      //   formController.gameTitleCon.text = daynResult["gameTitle"] ?? '';
      //   formController.team1Con.text = daynResult["team1"] ?? '';
      //   formController.team2Con.text = daynResult["team2"] ?? '';
      //   formController.score1Con.text = daynResult["score1"] ?? '';
      //   formController.score2Con.text = daynResult["score2"] ?? '';
      //   formController.stadiumCon.text = daynResult["stadium"] ?? '';
      //   formController.seatLocationCon.text = daynResult["seatLocation"] ?? '';
      //   formController.commentCon.text = daynResult["comment"] ?? '';
      //   formController.review.text = daynResult["reviewComment"] ?? '';
      //   formController.mood.value = daynResult["mood"] ?? '';
      //   formController.rating.value = daynResult["rating"] ?? 0;
      //   formController.playerOfTheMatch.text =
      //       daynResult["playerOfTheMatch"] ?? '';
      //   formController.food.text = daynResult["food"] ?? '';
      // }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,

      // 앱 바
      appBar: _AppBar(isEditMode: isEditMode),

      body: SafeArea(
        // 폼 스크린 (경기 관람 작성 / 일기(리뷰) 작성)
        child: _FormScreens(
            formController: formController,
            formKey: formKey,
            isEditMode: isEditMode),
      ),

      // 확인 버튼 2개 (일기 작성 / 작성 완료)
      bottomNavigationBar: _BottomButtonBar(
          formController: formController,
          formKey: formKey,
          isEditMode: isEditMode),
    );
  }
}
