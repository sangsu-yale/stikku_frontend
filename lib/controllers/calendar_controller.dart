import 'package:get/get.dart';
import 'package:stikku_frontend/utils.dart';

class CalendarController extends GetxController {
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
    DateTime.utc(2024, 7, 8): [const Event('cancel')],
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

  List<Event> getEventsForDay(DateTime date) {
    return events[date] ?? [];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }
}
