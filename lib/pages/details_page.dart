import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/calendar_controller.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'package:stikku_frontend/pages/write_page.dart';
import 'package:stikku_frontend/utils/functions.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/widgets/details/back_view.dart';
import 'package:stikku_frontend/widgets/details/front_view.dart';

part '../widgets/details/parts/appbar.dart';
part '../widgets/details/parts/cards.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final gameResult = Get.arguments["gameResult"];
  final gameReview = Get.arguments["gameReview"];

  final isarController = Get.find<IsarService>();
  final formController = Get.find<FormController>();
  final calendarController = Get.find<CalendarController>();
  final ListTopSearchController listTopSearchController = Get.find();
  final ScreenshotController screenshotController = ScreenshotController();
  final List<GlobalKey> cardKeys = [GlobalKey(), GlobalKey()];

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.85);
    final smallSize = MediaQuery.of(context).size.height < 700;

    return Scaffold(
      // 앱 바 (삭제 / 수정 / 저장)
      appBar: _AppBar(
        formController: formController,
        gameResult: gameResult,
        onScreenshot: () => takeScreenshot(controller.page!.round(), cardKeys),
      ),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Cards(
                cardKeys: cardKeys,
                gameResult: gameResult,
                smallSize: smallSize,
                gameReview: gameReview,
                pageIndex: index);
          },
        ),
      ),
    );
  }
}
