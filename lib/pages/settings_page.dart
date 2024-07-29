import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class SettingsPage extends StatelessWidget {
  final isarController = Get.find<IsarService>();
  SettingsPage({super.key});

  Future<String?> getUUID() async {
    final uuid = await isarController.getAllUsers();
    return uuid;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  child: const Text("uuid 님"),
                ),
                const Text(
                  "로그인을 하면 다른 기기로 로그인시 데이터가 유지돼요!",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/login');
                  },
                  child: const Text("가입/로그인하기"),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () async {
                    await isarController.deleteDefaultUser();
                  },
                  child: const ListTile(
                    leading: Icon(Icons.heart_broken),
                    title: Text("모든 데이터 삭제하기"),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text("문의하기"),
                ),
                // const ListTile(
                //   leading: Icon(Icons.import_contacts),
                //   title: Text("아이콘 변경"),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/// 핵심 기능
/// - ✅ 설정 기능
/// - ✅ 앱 시작시 게스트 로그인이 되어야 한다
///   - ✅ 로컬 스토리지, 로컬 DB에 저장이 되어야 한다
/// - ✅ 로그인을 할 수 있는 버튼이 존재해야 한다
///   - ✅ 로그인 페이지가 있어야 한다
///   - 구글, 카카오 로그인이 가능해야 한다
/// - ✅ 게스트의 모든 내용을 삭제할 수 있다
/// - ✅ 게스트의 기본적인 내용 (uuid)을 확인할 수 있다
/// 
/// - 로그인 기능
///   - 닉네임 수정이 가능해야 한다
///   - 로그인 기능 넣을 때 다시 생각합시다