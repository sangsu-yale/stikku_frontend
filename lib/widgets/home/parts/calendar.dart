part of '../../../pages/home_page.dart';

class _Calendar extends StatelessWidget {
  _Calendar({
    required this.calendarController,
    required this.isarController,
  });

  final CalendarController calendarController;
  final IsarService isarController;
  final GameResult gameResult = GameResult();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double textSize = 18 * constraints.maxWidth / 400;

          return Obx(() {
            return TableCalendar(
              // 기본 설정
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2050, 12, 31),
              focusedDay: calendarController.focusedDay.value,
              startingDayOfWeek: StartingDayOfWeek.monday,
              locale: 'ko_KR',
              daysOfWeekHeight: 30,
              rowHeight: constraints.maxHeight * 0.11, // 세로 410까지 OK
              // 이벤트 로더 (저장한 이벤트를 보여 준다)
              eventLoader: (day) => isarController.getEventsForDay(day),
              // 선택한 날짜의 onTap
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
                calendarController.onDaySelected(selectedDay, focusedDay);
                // 만약에 선택한 날짜에 이벤트가 있으면 details 페이지로 이동
                final events = isarController.getEventsForDay(selectedDay);
                if (events.isNotEmpty) {
                  // 이벤트가 있으면 details 페이지로 이동
                  await goToDetails(isarController, selectedDay.toLocal());
                } else {
                  // 없으면 write
                  gameResult.result.isBlank;
                  Get.toNamed('/write',
                      arguments: GameResult(date: selectedDay));
                }
              },
              selectedDayPredicate: (day) =>
                  isSameDay(day, calendarController.selectedDay.value),

              // 날짜 셀 커스터마이징
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(7.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${date.day}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                selectedBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(7.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${date.day}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                markerBuilder: (context, day, events) {
                  if (events.isNotEmpty) {
                    Event event = events.first as Event;

                    String eventDetail = event.eventDetails.isNotEmpty
                        ? event.eventDetails.first
                        : '';

                    GameResultType? resultType =
                        GameResultType.values.firstWhere(
                      (type) => type.name == eventDetail,
                    );

                    return Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Center(
                        child: Image(
                          image: resultType.icon,
                          // color: resultType.color,
                          width: 40,
                          // size: 40,
                          // shadows: [
                          //   BoxShadow(
                          //     color: resultType.color,
                          //     spreadRadius: 10,
                          //     blurRadius: 10,
                          //     offset: const Offset(0, 0),
                          //   ),
                          // ],
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),

              // 캘린더 헤더 스타일
              headerStyle: calendarHeaderStyle(context),
              // 요일 스타일
              daysOfWeekStyle: calendarDaysofweekStyle(context, textSize),
              // 캘린더 바디 스타일
              calendarStyle: calendarBodyStyle(),
            );
          });
        },
      ),
    );
  }
}
