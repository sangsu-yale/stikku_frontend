part of '../../../pages/user_n_data_page.dart';

class _List extends StatelessWidget {
  final IsarService isarController = Get.find<IsarService>();
  final ListTopSearchController listTopSearchController = Get.find();
  final NavigationController navigationController =
      Get.find<NavigationController>();
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            content:
                                const Text('닉네임을 설정하고 싶다면 로그인/회원가입을 진행하세요.'),
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
                      title: const Text('이전에 작성했던 데이터를 불러올까요?'),
                      content: const Text('로그인한 사용자는 이전에 썼던 데이터를 불러올 수 있습니다.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('닫기'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await isarController.getBackupData();
                            // 리스트 업데이트
                            listTopSearchController.loadGameResults();

                            Get.dialog(
                              AlertDialog(
                                title: const Text('데이터를 불러왔습니다'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () async {
                                      Get.back();
                                      navigationController.changePage(0);
                                      Get.toNamed('/');
                                    },
                                    child: const Text('닫기'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('불러오기'),
                        ),
                      ],
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(Custom.strategy, color: Colors.blue),
                  title: Text("이전 데이터 불러오기"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('데이터를 전부 삭제할까요?'),
                      content: const Text('한번 삭제된 데이터는 복구할 수 없으니 신중히 선택해 주세요.'),
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
    );
  }
}
