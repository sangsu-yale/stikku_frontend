import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/diary_dialog_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';

class DiaryPage extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());
  final FormController formController = Get.put(FormController());
  final DiaryDialogController diaryDialogController =
      Get.put(DiaryDialogController());

  DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        automaticallyImplyLeading: true,
        title: const Text("추가 기록 작성 페이지"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView(
                children: [
                  ...diaryDialogController.pageWidgets.map(
                    (widget) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(child: widget.values.first),
                          IconButton(
                            onPressed: () =>
                                diaryDialogController.removePageWidget(widget),
                            icon: const Icon(Icons.cancel),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.dialog(DiaryDialogWidget(
                          diaryDialogController: diaryDialogController));
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),

          // 버튼
          TextButton(
            onPressed: () {},
            child: const Text("완료하기"),
          )
        ],
      ),
    );
  }
}



/// 핵심 기능
/// - 폼
///   - 기본 위젯이 3개 있어야 한다
///   - 위젯 체크박스를 해제하면 없어져야 한다
///   - 위젯을 추가/삭제할 수 있다
///   - 확인 버튼이 있어야 한다
///   - 아무것도 작성하지 않아도 폼이 전송되어야 한다
///   - 위젯 추가 버튼이 있어야 한다
/// 
/// - 추가 위젯
///   - dialog를 통해 위젯이 보여야 한다
///   - 추가/삭제를 할 수 있다
///   - 추가/삭제를 하면 폼에서도 사라져야 한다
///   - 추가/삭제할 시 위의 라벨도 움직여야 한다
///   - 폼에 데이터가 있을 시, 삭제할 것이냐고 물어봐야 한다
///   - 모든 위젯이 들어가 있어야 한다
///     - 관람평
///     - 별점
///     - 수훈선수
///     - 기분
///     - 직관음식
///     - 라인업
/// 
/// - 서버 API
///   - 서버에 폼의 데이터를 보낼 수 있다
///   - 로컬 스토리지에 데이터를 저장할 수 있다
///   - 서버에 이미지를 전달할 수 있다 (파일 값 물어볼 것)


// 남은 것
// 일기 작성
// 리스트 페이지
// 디테일 페이지

// adv : 차트, 설정
// 로그인
// 임시 게스트