import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/widgets/calendar/calendar_body_style.dart';
import 'package:stikku_frontend/widgets/calendar/calendar_daysofweek_style.dart';
import 'package:stikku_frontend/widgets/calendar/calendar_header_style.dart';
import 'package:table_calendar/table_calendar.dart';

part '../widgets/calendar/save_calendar_image_button.dart';
part '../widgets/calendar/fab_write_button.dart';
part '../widgets/calendar/calendar.dart';

class HomePage extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());
  final isarController = Get.find<IsarService>();
  final GameResult gameResult = GameResult();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final events =
        isarController.getEventsForDay(calendarController.today.value);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              // 달력 저장하기 버튼
              _SaveCalendarImageButton(),

              // 달력
              _Calendar(
                  calendarController: calendarController,
                  isarController: isarController),
            ],
          ),
        ),
      ),

      // 플로팅 버튼
      floatingActionButton: events.isNotEmpty
          ? IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.blue[50],
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
              ),
              onPressed: () async {
                final todayTicket = await isarController
                    .getDetails(calendarController.today.value);
                Get.toNamed('/details', arguments: todayTicket);
              },
              icon: const Icon(Custom.noteblank, size: 30, color: Colors.blue))
          : _FabWriteButton(
              calendarController: calendarController,
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
/// - (😡adv) ✅ 로컬 드라이브
///   - ✅ ⛏️ 로컬 드라이브에 이벤트를 저장할 수 있다
