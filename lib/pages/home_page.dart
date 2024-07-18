import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/widgets/calendar/calendar_body_style.dart';
import 'package:stikku_frontend/widgets/calendar/calendar_daysofweek_style.dart';
import 'package:stikku_frontend/widgets/calendar/calendar_header_style.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());
  final isarController = Get.find<IsarService>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // 달력 저장하기 버튼
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                ),
              ),
            ),

            // 달력
            Flexible(
              flex: 8,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double cellSize = constraints.maxWidth * 0.11;
                  double textSize = 18 * constraints.maxWidth / 340;

                  return calendar(constraints, context, textSize, cellSize);
                },
              ),
            ),
            // 남은 공간 채우기
          ],
        ),
      ),

      // 플로팅 버튼
      floatingActionButton: writeButton(context),
    );
  }

// <!------------- 달력 -------------->
  Widget calendar(BoxConstraints constraints, BuildContext context,
      double textSize, double cellSize) {
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
        eventLoader: calendarController.getEventsForDay,

        // 선택한 날짜의 onTap
        onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
          calendarController.onDaySelected(selectedDay, focusedDay);
          // 만약에 선택한 날짜에 이벤트가 있으면 details 페이지로 이동
          final events = calendarController.getEventsForDay(selectedDay);
          if (events.isNotEmpty) {
            // 이벤트가 있으면 details 페이지로 이동
            // details 정보 얻어서 꽂아 줘야지...
            print(selectedDay);
            final gameResult =
                await isarController.getDetails(selectedDay.toLocal());
            Get.toNamed(
              '/details',
              arguments: gameResult,
            );
          } else {
            // 없으면 write
            Get.toNamed('/write',
                arguments: {"result": "", "day": selectedDay});
          }
        },
        selectedDayPredicate: (day) =>
            isSameDay(day, calendarController.selectedDay.value),

        // 날짜 셀 커스터마이징
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, day, events) {
            if (events.isNotEmpty) {
              Event event = events.first as Event;

              String eventDetail =
                  event.eventDetails.isNotEmpty ? event.eventDetails.first : '';

              Color color;
              switch (eventDetail) {
                case 'cancel':
                  color = Colors.red;
                  break;
                case 'win':
                  color = Colors.green;
                  break;
                case 'lose':
                  color = Colors.blue;
                  break;
                case 'tie':
                  color = Colors.yellow;
                  break;
                default:
                  color = Colors.grey;
              }

              return Container(
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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
  }

// <!------------- 플로팅 버튼 -------------->
  Container writeButton(BuildContext context) {
    double btnSize = MediaQuery.of(context).size.width / 7;

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(113, 55, 140, 231),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: SpeedDial(
        childrenButtonSize: Size(btnSize, btnSize),
        buttonSize: Size(btnSize, btnSize),
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        activeBackgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        direction: SpeedDialDirection.left,
        icon: Icons.edit,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        childPadding: const EdgeInsets.symmetric(vertical: 0),
        elevation: 0,
        spacing: 0,
        spaceBetweenChildren: 1,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          dialChild("cancel", "취", Icons.cancel),
          dialChild("tie", "무", Icons.time_to_leave),
          dialChild("lose", "패", Icons.class_),
          dialChild("win", "승", Icons.star),
        ],
      ),
    );
  }

// child 버튼 설정
  SpeedDialChild dialChild(result, resultLabel, resultIcon) {
    return SpeedDialChild(
      elevation: 0,
      onTap: () {
        Get.toNamed('/write', arguments: {
          "result": result,
          "day": calendarController.selectedDay.value
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            resultIcon,
          ),
          Text(resultLabel)
        ],
      ),
    );
  }
}

/// 핵심 기능
/// - 캘린더 기능
///   - ✅ 앱 실행시 오늘 날짜가 강조 되어야 한다
///   - ✅ 앱 실행시 이벤트 마크가 붙어 있어야 한다
///   - ✅ 다른 날짜를 클릭하면 포커스 마크가 이동이 되어야 한다
///   - ✅ (일기 작성시) 오늘 날짜에 이벤트 마크만 붙어 있어야 한다
///   - ✅ (일기 작성시) 해당 날짜에 이벤트 마크가 붙어야 한다
///   - ✅ (일기 작성 완료 후) 셀렉트 마크가 오늘로 다시 고정되어야 한다
///   - ⛏️ 이벤트가 있는 날짜 클릭 시 detail 페이지로 이동해야 한다
///
/// - 일기 작성 기능
///   - ✅ 날짜를 클릭하여 일기 작성이 가능해야 한다
///   - ✅ 작성 버튼을 클릭하여 일기 작성이 가능해야 한다
///   - ✅ 경기 결과에 따라서 마커가 달라져야 한다
///   - (😡adv) 일기를 2회 작성할 수 있다
///
/// - (😡adv) 이미지 저장 기능
///   - ⛏️ 달력을 이미지로 저장할 수 있다
///
/// - (😡adv) 로컬 드라이브
///   - ⛏️ 로컬 드라이브에 이벤트를 저장할 수 있다
