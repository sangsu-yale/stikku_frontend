import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/utils/services/api_user_service.dart';

part '../widgets/login/parts/appbar.dart';
part '../widgets/login/parts/image_container.dart';
part '../widgets/login/parts/login_container.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final List<String> _imagePaths = [
    'assets/images/sports/undraw_3.png',
    'assets/images/sports/undraw_5.png',
    'assets/images/sports/undraw_8.png',
    'assets/images/sports/undraw_13.png',
    'assets/images/sports/undraw_14.png',
  ];

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final int index = random.nextInt(_imagePaths.length);

    return Scaffold(
      appBar: const _Appbar(),
      body: SizedBox(
        child: Column(
          children: [
            _ImageContainer(imagePaths: _imagePaths, index: index),
            const _LoginContainer()
          ],
        ),
      ),
    );
  }
}
