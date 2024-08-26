import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/widgets/write/diary_form.dart';
import 'package:stikku_frontend/widgets/write/game_result_form.dart';

part '../widgets/write/parts/appbar.dart';
part '../widgets/write/parts/bottom_button_bar.dart';
part '../widgets/write/parts/form_screens.dart';

class WritePage extends StatelessWidget {
  final formController = Get.find<FormController>();

  final formKey = GlobalKey<FormState>();
  final bool isEditMode;

  WritePage({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    final GameResult gameResult = Get.arguments;
    // 경기 결과 및 날짜 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      formController.getGameResultFromArguments(gameResult, isEditMode);
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,

      // 앱 바
      appBar: _AppBar(isEditMode: isEditMode, formController: formController),

      body: SafeArea(
        // 폼 스크린 (경기 관람 작성 / 일기(리뷰) 작성)
        child: _FormScreens(
            formController: formController,
            formKey: formKey,
            isEditMode: isEditMode),
      ),

      // 확인 버튼 2개 (일기 작성 / 작성 완료)
      bottomNavigationBar: _BottomButtonBar(
          formController: formController,
          formKey: formKey,
          isEditMode: isEditMode),
    );
  }
}
