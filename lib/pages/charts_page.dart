import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/charts_controller.dart';
import 'package:stikku_frontend/utils/chart_pie_winning.dart';

part '../widgets/chart/parts/header.dart';
part '../widgets/chart/parts/draw_ratio.dart';
part '../widgets/chart/parts/text_ratio.dart';

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
        } else {
          final stats = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                _Header(stats: stats),
                _TextRatio(stats: stats),
                _DrawRatio(stats: stats),
              ],
            ),
          );
        }
      },
    ));
  }
}
