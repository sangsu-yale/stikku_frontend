import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class UserNDataPage extends StatelessWidget {
  UserNDataPage({super.key});

  final IsarService isarController = Get.find<IsarService>();
  final ListTopSearchController listTopSearchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          "유저 및 데이터",
          style: TextStyle(color: Colors.blue),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Custom.caretleft, color: Colors.blue),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    child: const ListTile(
                      leading: Icon(Custom.sealcheck, color: Colors.blue),
                      title: Text("닉네임 설정"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('데이터를 전부 삭제할까요?'),
                          content:
                              const Text('한번 삭제된 데이터는 복구할 수 없으니 신중히 선택해 주세요.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('닫기'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await isarController.deleteAllData();
                                listTopSearchController.loadGameResults();
                                Get.offAndToNamed('/');
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('삭제되었습니다'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          Get.back();
                                        },
                                        child: const Text('닫기'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text('삭제'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Custom.diamond, color: Colors.blue),
                      title: Text("데이터 전체 삭제"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('회원 탈퇴를 진행하시겠어요?'),
                          content: const Text('모든 데이터가 삭제됩니다.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text('닫기'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await isarController.deleteDefaultUser();
                                listTopSearchController.loadGameResults();
                                // TODO: 회원탈퇴 - 재부팅
                                Get.offAndToNamed('/');
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('탈퇴되었습니다.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          Get.back();
                                        },
                                        child: const Text('닫기'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text('삭제'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Custom.dicefive, color: Colors.blue),
                      title: Text("회원 탈퇴"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
