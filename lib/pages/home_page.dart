import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          double maxHeight = constraints.maxHeight;
          return Column(
            children: <Widget>[
              // 달력 저장하기 버튼
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                ),
              ),

              // 달력
              TableCalendar(
                rowHeight: maxHeight * 0.1,
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2050, 12, 31),
                focusedDay: DateTime.now(),
              ),
              const Spacer(),
            ],
          );
        }),
      ),
      floatingActionButton: SpeedDial(
        direction: SpeedDialDirection.left,
        animatedIcon: AnimatedIcons.play_pause,
        childPadding: const EdgeInsets.symmetric(vertical: 0),
        elevation: 0,
        spacing: 0,
        spaceBetweenChildren: 1,
        children: [
          SpeedDialChild(
            elevation: 0,
            onTap: () {
              Get.toNamed('/write');
            },
            child: const Icon(Icons.star),
          ),
          SpeedDialChild(
            elevation: 0,
            onTap: () {
              Get.toNamed('/write');
            },
            child: const Icon(Icons.cloud),
          ),
          SpeedDialChild(
            elevation: 0,
            onTap: () {
              Get.toNamed('/write');
            },
            child: const Icon(Icons.class_rounded),
          ),
          SpeedDialChild(
            elevation: 0,
            onTap: () {
              Get.toNamed('/write');
            },
            child: const Icon(Icons.umbrella),
          )
        ],
      ),
    );
  }
}
