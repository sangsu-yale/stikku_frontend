import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/utils/services/api_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
            const Flexible(
              flex: 8,
              child: Center(child: Text("아이콘 및 사진")),
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13),
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black12),
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
                        child: GestureDetector(
                          onTap: () async {
                            try {
                              print("1번");
                              login();
                              // Handle the result as necessary, such as navigating
                              // to another page or showing a message.
                              // print("결과 $result");
                            } catch (e) {
                              // Handle the error accordingly
                              print("에러 $e");
                            }
                            // print("구글 연동 api 받아오기");
                          },
                          child: const Row(
                            children: [
                              Icon(Custom.bread, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                "구글 연동하기",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 17),
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
