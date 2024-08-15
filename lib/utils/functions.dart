import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/controllers/user_controller.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

showNicknameDialog() {
  final TextEditingController nicknameController = TextEditingController();
  final UserController userController = Get.put(UserController());

  Get.dialog(
    AlertDialog(
      title: const Text('닉네임 변경'),
      content: TextField(
        controller: nicknameController,
        decoration: const InputDecoration(
          hintText: '변경할 닉네임',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // 입력된 닉네임을 가져옴
            String nickname = nicknameController.text.trim();

            if (nickname.isNotEmpty) {
              userController.changeNickname(nickname);
              Get.back();
            } else {
              // 닉네임이 비어 있을 때 처리
              Get.snackbar(
                '닉네임을 입력해주세요.',
                '닉네임란이 비어 있습니다.',
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          child: const Text('확인'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('취소'),
        ),
      ],
    ),
  );
}

// 캘린더 날짜, FAB 버튼, 리스트뷰, 그리드뷰 (write는 사용 X)
Future<void> goToDetails(IsarService isarController, DateTime date) async {
  final gameResult = await isarController.getDetails(date);
  final gameReview = await gameResult.loadGameReview();
  Get.toNamed('/details',
      arguments: {"gameResult": gameResult, "gameReview": gameReview});
}

// 로컬 스토리지 진입
Future<Map<String, dynamic>> getLocalStorageIsLogin() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return {"isLogin": prefs.getBool('isLogin')};
}

// 스샷 캡처
Future<void> takeScreenshot(int index, dynamic cardKeys) async {
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
