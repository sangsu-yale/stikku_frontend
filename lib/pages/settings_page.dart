import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/controllers/user_controller.dart';

class SettingsPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController = Get.find();
  final UserController userController = Get.put(UserController());

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_4_rounded,
                    size: 50, color: Colors.blue),
                const SizedBox(width: 10),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${userController.userName} 님",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          userController.isLogin.value
                              ? "반가워요!"
                              : "로그인하면 다른 기기 연동이 가능해요!",
                          style:
                              const TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            if (userController.isLogin.value) {
                              userController.logout();
                            } else {
                              Get.toNamed('/login');
                            }
                          },
                          child: userController.isLogin.value
                              ? const Text("로그아웃")
                              : const Text("가입/로그인하기"),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Text(
                    "설정",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/userdata');
                  },
                  child: const ListTile(
                    leading: Icon(Custom.pingpong, color: Colors.blue),
                    title: Text("유저 및 데이터"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/splash');
                  },
                  child: const ListTile(
                    leading: Icon(Custom.target, color: Colors.blue),
                    title: Text("문의하기"),
                  ),
                ),
                GestureDetector(
                  child: const ListTile(
                    leading: Icon(Custom.checkerboard_1, color: Colors.blue),
                    title: Text("메뉴 아이콘 변경하기"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
