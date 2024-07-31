import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/widgets/diary/diary_widgets.dart';

class DiaryDialogController extends GetxController {
  // 전체는 여기
  var formWidgets =
      <Map<String, Widget>>[].obs; // List of widget ID and widget pairs

  // 선택하는 건 여기
  var selectedWidgets = <Map<String, Widget>>[].obs;

  // 보여 주는 건 여기
  var pageWidgets = <Map<String, Widget>>[].obs;

  @override
  void onInit() {
    super.onInit();
    formWidgets.assignAll([
      {'review': Review(id: 'review', title: '경기 리뷰')},
      {
        'playerOfTheMatch':
            PlayerOfTheMatch(id: 'playerOfTheMatch', title: '수훈 선수')
      },
      {'rating': Rating(id: 'rating', title: '별점')},
      {'mood': Mood(id: 'mood', title: '기분')},
      {'food': Food(id: 'food', title: '음식')},
      // {'homeTeamLineup': HomeTeamLineup(id: 'homeTeamLineup', title: '홈 라인업')},
      // {
      //   'awayTeamLineup': AwayTeamLineup(id: 'awayTeamLineup', title: '어웨이 라인업')
      // },
    ]);
    addWidget(
      {'review': Review(id: 'review', title: '경기 리뷰')},
    );
    confirmSelection();
  }

  void addWidget(Map<String, Widget> widget) {
    if (!selectedWidgets.any(
        (selectedWidget) => selectedWidget.keys.first == widget.keys.first)) {
      selectedWidgets.add(widget);
      update(); // Notify the change
    }
  }

  void removeWidget(Map<String, Widget> widget) {
    selectedWidgets.removeWhere(
        (selectedWidget) => selectedWidget.keys.first == widget.keys.first);
    update(); // Notify the change
  }

  void confirmSelection() {
    pageWidgets.assignAll(selectedWidgets);
    update(); // Notify the change
  }

  void removePageWidget(Map<String, Widget> widget) {
    pageWidgets
        .removeWhere((element) => element.keys.first == widget.keys.first);
    selectedWidgets
        .removeWhere((element) => element.keys.first == widget.keys.first);
    update(); // Notify the change
  }

  String getWidgetTitle(Map<String, Widget> widget) {
    switch (widget.keys.first) {
      case 'review':
        return '경기 리뷰';
      case 'playerOfTheMatch':
        return '수훈 선수';
      case 'rating':
        return '별점';
      case 'mood':
        return '기분';
      case 'food':
        return '음식';
      case 'homeTeamLineup':
        return '홈팀 라인업';
      case 'awayTeamLineup':
        return '원정팀 라인업';
      default:
        return 'Unknown Widget';
    }
  }

  bool isSelected(String widgetId) {
    return selectedWidgets
        .any((selectedWidget) => selectedWidget.keys.first == widgetId);
  }
}

class DiaryDialogWidget extends StatelessWidget {
  const DiaryDialogWidget({
    super.key,
    required this.diaryDialogController,
  });

  final DiaryDialogController diaryDialogController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Text(
                  diaryDialogController.selectedWidgets
                      .map((widget) =>
                          diaryDialogController.getWidgetTitle(widget))
                      .join(', '),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ...diaryDialogController.formWidgets.map((widget) => Obx(() {
                        final widgetId = widget.keys.first;
                        final widgetInstance = widget.values.first;
                        final isSelected =
                            diaryDialogController.isSelected(widgetId);
                        return GestureDetector(
                          onTap: () {
                            if (isSelected) {
                              diaryDialogController.removeWidget(widget);
                            } else {
                              diaryDialogController.addWidget(widget);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4.0),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.blue[50]
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Icon(
                                      isSelected
                                          ? Custom.caretcircledown_1
                                          : null,
                                      color: Colors.blue,
                                    ),
                                    IgnorePointer(child: widgetInstance)
                                  ]),
                            ),
                          ),
                        );
                      })),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shadowColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                onPressed: () {
                  diaryDialogController.confirmSelection();
                  Get.back();
                },
                child: const Text('확인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
