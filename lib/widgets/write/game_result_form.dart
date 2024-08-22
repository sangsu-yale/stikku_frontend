import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/constants/result_enum.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/widgets/write/basic_form_widget.dart';

part '../write/section_0_form.dart';
part '../write/section_1_form.dart';
part '../write/section_2_form.dart';
part '../write/section_3_form.dart';
part '../write/section_4_form.dart';

class GameResultForm extends StatelessWidget {
  GameResultForm({super.key});
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      // <------------- 스크롤뷰 ------------->
      child: SingleChildScrollView(
        // <------------- 폼 시작 ------------->
        child: Column(
          children: [
            _Section0Form(formController: formController),
            // // 1번 : 직관 유무 / 게임 결과 / 팀별 점수, 이름 / 응원팀 유무
            _Section1Form(
              formController: formController,
            ),

            // // 2번 : 경기장 / 좌석
            _Section2Form(formController: formController),

            // // 3번 : 경기 제목 / 코멘트
            _Section3Form(formController: formController),

            // // 4번 : 이미지
            _Section4Form(formController: formController),
          ],
        ),
      ),
    );
  }
}
