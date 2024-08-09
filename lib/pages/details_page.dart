import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
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

  final gameResult = Get.arguments["gameResult"];
  final gameReview = Get.arguments["gameReview"];

  final isarController = Get.find<IsarService>();
  final formController = Get.find<FormController>();
  final calendarController = Get.find<CalendarController>();
  final ListTopSearchController listTopSearchController = Get.find();
  final ScreenshotController screenshotController = ScreenshotController();
  final List<GlobalKey> cardKeys = [GlobalKey(), GlobalKey()];

  Future<void> takeScreenshot(int index) async {
    try {
      // 스크린샷 캡처
      RenderRepaintBoundary boundary = cardKeys[index]
          .currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 4.0); // 더 높은 해상도
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // 이미지 저장
      final result = await ImageGallerySaver.saveImage(pngBytes);
      if (result != null && result['isSuccess'] == true) {
        Get.snackbar('티켓이 저장되었습니다', '갤러리를 확인해 보세요');
      } else {
        Get.snackbar('저장 실패', '이미지 저장에 실패했습니다. 다시 시도해 주세요.');
      }
    } catch (e) {
      // 예외 처리
      Exception(e);
      Get.snackbar('오류 발생', '잠시 후 다시 시도해 주세요. 문제 해결을 위해 문의해 주세요.');
    }

    // // 권한 요청
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   print("권한 요청 팝업 띄우는 중");
    //   status = await Permission.storage.request();
    // }

    // if (status.isGranted) {
    //   try {
    //     // 스크린샷 캡처
    //     RenderRepaintBoundary boundary = cardKeys[index]
    //         .currentContext!
    //         .findRenderObject() as RenderRepaintBoundary;
    //     var image = await boundary.toImage(pixelRatio: 4.0); // 더 높은 해상도
    //     ByteData? byteData =
    //         await image.toByteData(format: ImageByteFormat.png);
    //     Uint8List pngBytes = byteData!.buffer.asUint8List();

    //     // 이미지 저장
    //     final result = await ImageGallerySaver.saveImage(pngBytes);
    //     if (result != null && result['isSuccess'] == true) {
    //       Get.snackbar('티켓이 저장되었습니다', '갤러리를 확인해 보세요');
    //     } else {
    //       Get.snackbar('저장 실패', '이미지 저장에 실패했습니다. 다시 시도해 주세요.');
    //     }
    //   } catch (e) {
    //     // 예외 처리
    //     print('Error: $e'); // 디버깅을 위한 로그
    //     Get.snackbar('오류 발생', '잠시 후 다시 시도해 주세요. 문제 해결을 위해 문의해 주세요.');
    //   }
    // } else {
    //   Get.snackbar('저장 권한이 거부되었습니다', '앱 설정에서 권한을 허용해 주세요.');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.85);
    final smallSize = MediaQuery.of(context).size.height < 700;

    return Scaffold(
      appBar: _AppBar(
        formController: formController,
        gameResult: gameResult,
        onScreenshot: () => takeScreenshot(controller.page!.round()),
      ),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 2,
          itemBuilder: (context, index) {
            return RepaintBoundary(
              key: cardKeys[index],
              child: Card(
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                elevation: 4.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: index == 0
                        ? FrontView(
                            gameResult: gameResult, smallSize: smallSize)
                        : BackView(
                            gameReview: gameReview, smallSize: smallSize)),
              ),
            );
          },
        ),
      ),
    );
  }
}
