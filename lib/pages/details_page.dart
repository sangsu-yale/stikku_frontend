import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/pages/write_page.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/widgets/details/back_view.dart';
import 'package:stikku_frontend/widgets/details/front_view.dart';

part '../widgets/details/appbar.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final GameResult gameResult = Get.arguments!;
  final isarController = Get.find<IsarService>();
  final formController = Get.find<FormController>();
  final calendarController = Get.find<CalendarController>();
  final ListTopSearchController listTopSearchController = Get.find();

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.85);
    final smallSize = MediaQuery.of(context).size.height < 700;

    return Scaffold(
      appBar: _AppBar(formController: formController, gameResult: gameResult),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              elevation: 4.0,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: index == 0
                      ? FrontView(gameResult: gameResult, smallSize: smallSize)
                      : BackView(gameResult: gameResult, smallSize: smallSize)),
            );
          },
        ),
      ),
    );
  }
}
