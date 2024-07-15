import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/services/isar_service.dart';

class CalendarController extends GetxController {
  final Isar _isar;
  CalendarController() : _isar = Get.find<IsarService>().isar;

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

  var events = <DateTime, List<Event>>{
    DateTime.utc(2024, 7, 8): [Event()],
  }.obs;

  void addEvent(DateTime date, Event event) {
    if (events[date] != null) {
      events[date]!.add(event);
    } else {
      events[date] = [event];
    }
    selectedDay = DateTime.now().toUtc().obs;
    events.refresh(); // UI를 갱신하기 위해 refresh 호출
  }

  // List<Event> getEventsForDay(DateTime date) {
  //   return events[date] ?? [];
  // }

  // 날짜별 이벤트를 가져오는 함수
  List<Event> getEventsForDay(DateTime day) {
    return _isar.events.filter().eventDateEqualTo(day).findAllSync();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }
}
