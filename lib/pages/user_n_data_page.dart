import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/controllers/navigation_controller.dart';
import 'package:stikku_frontend/controllers/user_controller.dart';
import 'package:stikku_frontend/utils/functions.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class UserNDataPage extends StatelessWidget {
  UserNDataPage({super.key});

  final IsarService isarController = Get.find<IsarService>();
  final ListTopSearchController listTopSearchController = Get.find();
  final NavigationController navigationController =
      Get.find<NavigationController>();
  final UserController userController = Get.put(UserController());

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
                    onTap: () async {
                      final isLogin = await getLocalStorageIsLogin();

                      isLogin["isLogin"]
                          ? showNicknameDialog()
                          : Get.dialog(
                              AlertDialog(
                                title: const Text('닉네임 변경이 불가합니다.'),
                                content: const Text(
                                    '닉네임을 설정하고 싶다면 로그인/회원가입을 진행하세요.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('닫기'),
                                  ),
                                ],
                              ),
                            );
                    },
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
                                navigationController.changePage(0);
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
                    onTap: () async {
                      final isLogin = await getLocalStorageIsLogin();
                      isLogin["isLogin"]
                          ? Get.dialog(
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
                                      await userController.deleteUser();
                                      listTopSearchController.loadGameResults();
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
                            )
                          : Get.dialog(
                              AlertDialog(
                                title: const Text('회원 탈퇴가 불가합니다.'),
                                content: const Text(
                                    '게스트는 회원이 아닙니다. 데이터를 지우고 싶다면 데이터 전체 삭제를 진행하세요.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('닫기'),
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

  showNicknameDialog() {
    final TextEditingController nicknameController = TextEditingController();

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
}
