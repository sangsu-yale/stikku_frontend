import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/charts_controller.dart';
import 'package:stikku_frontend/utils/chart_pie_winning.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage({super.key});
  final ChartsController chartsController = Get.put(ChartsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: chartsController.loadGameResults(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No events found'));
        } else {
          final stats = snapshot.data!;

          return stats["allViewCount"] == 0
              ? const Center(
                  child: Text(
                    "아직 관람한 경기가 없습니다",
                    style: TextStyle(color: Colors.black38),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                        margin: const EdgeInsets.only(bottom: 30),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(50))),
                        child: Text(
                          "총 승률 ${stats["totalWinRate"]}%",
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    text:
                                        "직관 승률 ${stats["liveGameWinRate"].toStringAsFixed(1)}% ",
                                  ),
                                  TextSpan(
                                    text:
                                        "(총 ${stats["liveGame"]}회 / ${stats["liveGameWinning"]}승)",
                                  )
                                ],
                                // style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "집관 승률 ${stats["homeGameWinRate"]}% ",
                                  ),
                                  TextSpan(
                                    text:
                                        "(총 ${stats["homeGame"]}회 / ${stats["homeGameWinning"]}승)",
                                  )
                                ],
                                // style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            const Text(
                              "직관 통계",
                              style: TextStyle(fontSize: 20),
                            ),
                            stats["liveGame"] == 0
                                ? AspectRatio(
                                    aspectRatio: 1.3,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            const Text(
                                              "아직 직관 관람이 없습니다",
                                              style: TextStyle(
                                                  color: Colors.black45),
                                            ),
                                            PieChart(
                                              PieChartData(
                                                borderData: FlBorderData(
                                                  show: true,
                                                ),
                                                sectionsSpace: 0,
                                                centerSpaceRadius: 20,
                                                sections: notShowingSections(),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  )
                                : AspectRatio(
                                    aspectRatio: 1.3,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: PieChart(
                                        PieChartData(
                                          borderData: FlBorderData(
                                            show: true,
                                          ),
                                          sectionsSpace: 0,
                                          centerSpaceRadius: 20,
                                          sections: showingSections(stats),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        }
      },
    ));
  }
}
