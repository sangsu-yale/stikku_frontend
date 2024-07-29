import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/charts_controller.dart';

class ChartsPage extends StatelessWidget {
  ChartsPage({super.key});
  final ChartsController chartsController = Get.put(ChartsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
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
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 30),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "총 승률 ${stats["totalWinRate"]}%",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.grey)),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black),
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
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            style: const TextStyle(fontSize: 25),
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        // const Text(
                        //   "직관 통계",
                        //   style: TextStyle(fontSize: 30),
                        // ),
                        AspectRatio(
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
      ),
    ));
  }
}

List<PieChartSectionData> showingSections(stats) {
  return List.generate(4, (i) {
    // final isTouched = i == touchedIndex;
    const fontSize = 16.0;
    const radius = 100.0;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.blue,
          value: stats["liveGameWinRate"],
          title: '승 ${stats["liveGameWinRate"].toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.red,
          value: stats["liveGamelose"],
          title: '패 ${stats["liveGamelose"]?.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      case 2:
        return PieChartSectionData(
          color: Colors.green,
          value: stats["liveGameTie"],
          title: '무 ${stats["liveGameTie"]?.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      case 3:
        return PieChartSectionData(
          color: Colors.grey,
          value: stats["liveGameCancel"],
          title: '취 ${stats["liveGameCancel"]?.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        );
      default:
        throw Exception('Oh no');
    }
  });
}
