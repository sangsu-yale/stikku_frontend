import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
      {'review': const Review(id: 'review', title: '경기 리뷰')},
      {'rating': const Rating(id: 'rating', title: '별점')},
      {
        'playerOfTheMatch':
            const PlayerOfTheMatch(id: 'playerOfTheMatch', title: '수훈 선수')
      },
      {'mood': const Mood(id: 'mood', title: '기분')},
      {'food': const Food(id: 'food', title: '음식')},
      {
        'homeTeamLineup':
            const HomeTeamLineup(id: 'homeTeamLineup', title: '홈 라인업')
      },
      {
        'awayTeamLineup':
            const AwayTeamLineup(id: 'awayTeamLineup', title: '어웨이 라인업')
      },
    ]);
    addWidget(
      {'review': const Review(id: 'review', title: '경기 리뷰')},
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
      case 'rating':
        return '별점';
      case 'playerOfTheMatch':
        return '수훈 선수';
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
              Column(
                children: [
                  ...diaryDialogController.formWidgets.map(
                    (widget) => Obx(() {
                      final widgetId = widget.keys.first;
                      final widgetInstance = widget.values.first;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                  diaryDialogController.getWidgetTitle(widget)),
                              Checkbox(
                                checkColor: Colors.white,
                                value: diaryDialogController.selectedWidgets
                                    .any((selectedWidget) =>
                                        selectedWidget.keys.first == widgetId),
                                onChanged: (value) {
                                  if (value == true) {
                                    diaryDialogController.addWidget(widget);
                                  } else {
                                    diaryDialogController.removeWidget(widget);
                                  }
                                },
                              ),
                            ],
                          ),
                          IgnorePointer(child: widgetInstance)
                        ],
                      );
                    }),
                  ),
                ],
              ),
              ElevatedButton(
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
