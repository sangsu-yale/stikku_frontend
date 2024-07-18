import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/config/isar_db.dart';

class CalendarController extends GetxController {
  final Isar _isar;
  CalendarController() : _isar = Get.find<IsarDB>().isar;

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

  // 날짜별 이벤트를 가져오는 함수
  List<Event> getEventsForDay(DateTime day) {
    return _isar.events.filter().eventDateEqualTo(day).findAllSync();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }
}
