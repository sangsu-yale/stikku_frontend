import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/controllers/isar_controller.dart';

class SettingsPage extends StatelessWidget {
  final IsarController isarController = Get.put(IsarController());
  SettingsPage({super.key});

  Future<String> getUUID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uuid = prefs.getString('uuid');
    return uuid ?? 'UUID not found';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.amber,
                  child: Column(
                    children: [
                      FutureBuilder<String>(
                        future: getUUID(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return const Text('Error loading UUID');
                          } else {
                            return Text(snapshot.data?.substring(24, 36) ??
                                'UUID not found');
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/login');
                        },
                        child: const Text("로그인하기"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                const ListTile(
                  leading: Icon(Icons.import_contacts),
                  title: Text("아이콘 변경"),
                ),
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