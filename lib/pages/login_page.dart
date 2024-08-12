import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/utils/services/api_user_service.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          "로그인",
          style: TextStyle(color: Colors.blue),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Custom.caretleft, color: Colors.blue),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Flexible(
              flex: 8,
              fit: FlexFit.tight,
              child: Image.asset(_imagePaths[index]),
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          try {
                            login();
                          } catch (e) {
                            Exception(e);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12, // 그림자의 색상과 투명도
                                  offset: Offset(0, 2.0), // 그림자의 위치
                                  blurRadius: 0, // 흐림 정도
                                  spreadRadius: 0, // 퍼짐 정도
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/google_logo.png',
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "구글 연동하기",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
