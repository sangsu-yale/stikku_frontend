part of '../../../pages/settings_page.dart';

class _Settings extends StatelessWidget {
  final ListTopSearchController listTopSearchController = Get.find();
  final UserController userController = Get.put(UserController());
  final IsarService isarController = Get.find<IsarService>();

  final NavigationController navigationController =
      Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          // GestureDetector(
          //   onTap: () {
          //     Get.toNamed('/userdata');
          //   },
          //   child: const ListTile(
          //     leading: Icon(Custom.pingpong, color: Colors.blue),
          //     title: Text("유저 및 데이터"),
          //   ),
          // ),
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
          // TODO: V2
          // GestureDetector(
          //   onTap: () {},
          //   child: const ListTile(
          //     leading: Icon(Custom.target, color: Colors.blue),
          //     title: Text("문의하기"),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () async {},
          //   child: const ListTile(
          //     leading: Icon(Custom.checkerboard_1, color: Colors.blue),
          //     title: Text("메뉴 아이콘 변경하기"),
          //   ),
          // ),
        ],
      ),
    );
  }
}
