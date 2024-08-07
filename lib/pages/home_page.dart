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
