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

  WritePage({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> daynResult = Get.arguments ?? {};

    print("수훈선수 : ${formController.playerOfTheMatch.value}");

    // 컨트롤러에 arguments 주입
    daynResult["result"] != null
        ? formController.result.value = daynResult["result"]
        : formController.result.value;
    daynResult["day"] != null
        ? formController.date = daynResult["day"].toUtc()
        : formController.date;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("경기 기록 작성 페이지"),
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
      bottomNavigationBar: _TwoBottomButtons(formController: formController),
    );
  }
}
