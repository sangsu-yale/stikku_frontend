import 'package:get/get.dart';

class CalendarController extends GetxController {
  // getEventsForDay 함수는 동기적으로 작동하기 때문에 isar_service.dart에 작성했습니다.

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

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }
}
