import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/widgets/write/diary_form.dart';
import 'package:stikku_frontend/widgets/write/game_result_form.dart';

part '../widgets/write/two_bottom_buttons.dart';

class WritePage extends StatelessWidget {
  final formController = Get.find<FormController>();
  final formKey = GlobalKey<FormState>();

  final bool isEditMode;

  WritePage({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> daynResult = Get.arguments ?? {};

    // 컨트롤러에 arguments 주입
    if (daynResult.isNotEmpty) {
      formController.result.value = daynResult["result"] ?? '';
      formController.date = daynResult["day"] ?? DateTime.now().toUtc();
      formController.gameTitleCon.text = daynResult["gameTitle"] ?? '';
      formController.team1Con.text = daynResult["team1"] ?? '';
      formController.team2Con.text = daynResult["team2"] ?? '';
      formController.score1Con.text = daynResult["score1"] ?? '0';
      formController.score2Con.text = daynResult["score2"] ?? '0';
      formController.stadiumCon.text = daynResult["stadium"] ?? '';
      formController.seatLocationCon.text = daynResult["seatLocation"] ?? '';
      formController.commentCon.text = daynResult["comment"] ?? '';
      formController.reviewCommentCon.text = daynResult["reviewComment"] ?? '';
      formController.mood.value = daynResult["mood"] ?? '';
      formController.rating.value = daynResult["rating"] ?? 0;
      formController.playerOfTheMatchCon.text =
          daynResult["playerOfTheMatch"] ?? '';
      formController.foodCon.text = daynResult["food"] ?? '';
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text(isEditMode ? "경기 기록 수정 페이지" : "경기 기록 작성 페이지"),
      ),

      // body
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Obx(() {
            return IndexedStack(
              index: formController.currentFormIndex.value,
              children: [GameResultForm(), DiaryForm()],
            );
          }),
        ),
      ),

      // 확인 버튼 2개 (일기 작성 / 작성 완료)
      bottomNavigationBar: BottomAppBar(
        height: 110,
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () {
                return BottomNavigationBar(
                  elevation: 1,
                  currentIndex: formController.currentFormIndex.value,
                  onTap: (index) {
                    formController.changeForm(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.sports_baseball), label: '게임 결과'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book), label: '관람 일기'),
                  ],
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //submit
                        formController.submit(isEditMode);
                      } else {
                        Get.snackbar(
                            '게임 결과 폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                      }
                    },
                    child: const Text("작성 완료"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
