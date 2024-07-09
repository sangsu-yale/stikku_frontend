import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/utils.dart';

class WritePage extends StatelessWidget {
  final CalendarController calendarController = Get.put(CalendarController());

  WritePage({super.key});

  final itemCount = 3;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        Get.arguments ?? {"result": "", "day": DateTime.now()};

    DateTime abc = arguments["day"];
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("경기 기록 작성 페이지"),
        ),
        // 뷰
        body: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              // 폼
              children: [
                // 예시로 추가된 더미 내용
                for (var i = 0; i < itemCount; i++)
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                color: Colors.white,
                                child: Text("아이템 $i"),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                color: Colors.white,
                                child: const Text("경기 내용"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.blue[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Get.toNamed('/diary');
                          },
                          child: const Text("일기 작성",
                              style: TextStyle(color: Colors.black)))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 80, 80, 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            calendarController.addEvent(
                                abc, Event(arguments["result"]));
                            Get.toNamed('/details');
                          },
                          child: const Text("작성 완료",
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
