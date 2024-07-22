import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';

part '../widgets/write/section_4_form.dart';
part '../widgets/write/section_3_form.dart';
part '../widgets/write/section_2_form.dart';
part '../widgets/write/section_1_form.dart';
part '../widgets/write/two_bottom_buttons.dart';

class WritePage extends StatelessWidget {
  final formController = Get.find<FormController>();
  final diaryDialogController = Get.find<DiaryDialogController>();

  final bool isEditMode;

  WritePage({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> daynResult = Get.arguments ?? {};

    // 컨트롤러에 arguments 주입
    if (daynResult.isNotEmpty) {
      formController.result.value = daynResult["result"] ?? '';
      formController.date = daynResult["day"] ?? DateTime.now().toUtc();
      formController.gameTitle.value = daynResult["gameTitle"] ?? '';
      formController.team1.value = daynResult["team1"] ?? '';
      formController.team2.value = daynResult["team2"] ?? '';
      formController.score1.value = daynResult["score1"] ?? '0';
      formController.score2.value = daynResult["score2"] ?? '0';
      formController.stadium.value = daynResult["stadium"] ?? '';
      formController.seatLocation.value = daynResult["seatLocation"] ?? '';
      formController.comment.value = daynResult["comment"] ?? '';
      formController.reviewComment.value = daynResult["reviewComment"] ?? '';
      formController.playerOfTheMatch.value =
          daynResult["playerOfTheMatch"] ?? '';
      formController.food.value = daynResult["food"] ?? '';
    }
// 수정 모드 플래그 설정

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(isEditMode ? "경기 기록 수정 페이지" : "경기 기록 작성 페이지"),
      ),

      // body
      body: Container(
        padding: const EdgeInsets.all(15),
        // <------------- 스크롤뷰 ------------->
        child: SingleChildScrollView(
          // <------------- 폼 시작 ------------->
          child: Column(
            children: [
              // 1번 : 직관 유무 / 게임 결과 / 팀별 점수, 이름 / 응원팀 유무
              _Section1Form(
                formController: formController,
              ),

              // 2번 : 경기장 / 좌석
              _Section2Form(formController: formController),

              // 3번 : 경기 제목 / 코멘트
              _Section3Form(formController: formController),

              // 4번 : 이미지
              _Section4Form(formController: formController),
            ],
          ),
        ),
      ),
      // 확인 버튼 2개 (일기 작성 / 작성 완료)
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Row(
          children: <Widget>[
            // <------------- 작성 완료 버튼 ------------->
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (formController.validate() == false) {
                    Get.snackbar('폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                  } else {
                    formController.submit(isEditMode);
                  }
                },
                child: Container(
                  color: Colors.blue[100],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("작성 완료", style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),

            // <------------- 일기 작성 버튼 ------------->
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (formController.validate() == false) {
                    Get.snackbar('폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                  } else {
                    Get.toNamed('/diary', arguments: isEditMode);
                  }
                },
                child: Container(
                  color: const Color.fromARGB(255, 80, 80, 80),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("일기 작성하기 >", style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





 // _TwoBottomButtons(formController: formController),