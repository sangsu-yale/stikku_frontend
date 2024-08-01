import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/widgets/diary/diary_widgets.dart';

class DiaryForm extends StatelessWidget {
  final bool isEditMode;
  DiaryForm(this.isEditMode, {super.key});

  final diaryDialogController = Get.find<DiaryDialogController>();
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    // 예시: formController에 데이터를 설정합니다.
    if (isEditMode) {
      if (formController.rating.value != 0) {
        diaryDialogController.addWidget(
          {'rating': Rating(id: 'rating', title: '별점')},
        );
      }
      if (formController.review.text != '') {
        diaryDialogController.addWidget(
          {'review': Review(id: 'review', title: '경기 리뷰')},
        );
      }
      if (formController.playerOfTheMatch.text != '') {
        diaryDialogController.addWidget(
          {
            'playerOfTheMatch':
                PlayerOfTheMatch(id: 'playerOfTheMatch', title: '수훈 선수')
          },
        );
      }
      if (formController.mood.value != '') {
        diaryDialogController.addWidget(
          {'mood': Mood(id: 'mood', title: '기분')},
        );
      }
      if (formController.food.text != '') {
        diaryDialogController.addWidget(
          {'food': Food(id: 'food', title: '음식')},
        );
      }
      diaryDialogController.confirmSelection();
    }

    return Container(
      height: double.infinity,
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1.0, color: Colors.blue),
              ),
              child: Column(
                children: [
                  Obx(
                    () => ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ...diaryDialogController.pageWidgets.map(
                            (widget) => Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: widget.values.first),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      if (widget.keys.first == 'rating') {
                                        formController.rating.value = 0;
                                      } else if (widget.keys.first == 'mood') {
                                        formController.mood.value = '';
                                      } else {
                                        final controller =
                                            formController.getTextController(
                                                widget.keys.first);
                                        controller.text = ''; // 텍스트 필드를 비웁니다.
                                      }

                                      diaryDialogController
                                          .removePageWidget(widget);
                                    },
                                    child: const Icon(Custom.x,
                                        size: 20, color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: WidgetStateProperty.all<Color>(
                                  Colors.transparent),
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white),
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.blue),
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(0)),
                              textStyle: WidgetStateProperty.all<TextStyle>(
                                  const TextStyle(fontSize: 18)),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.dialog(DiaryDialogWidget(
                                  diaryDialogController:
                                      diaryDialogController));
                            },
                            child: const Icon(Custom.pluscircle, size: 30),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            const Text(
              "일기는 작성하지 않아도 상관없어요",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
