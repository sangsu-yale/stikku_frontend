import 'package:get/get.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class CalendarController extends GetxController {
  // getEventsForDay 함수는 동기적으로 작동하기 때문에 isar_service.dart에 작성했습니다.
  final isarController = Get.find<IsarService>();

  var selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  var focusedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  var today = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).obs;

  // 선택된 날짜의 이벤트 리스트를 저장

  var eventsForSelectedDay = <Event>[].obs;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }
}
