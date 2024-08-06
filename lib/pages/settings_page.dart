import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class SettingsPage extends StatelessWidget {
  final isarController = Get.find<IsarService>();
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "게스트-${isarController.uuid} 님",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "로그인하면 다른 기기 연동이 가능해요!",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(
                          '/login',
                        );
                      },
                      child: const Text("가입/로그인하기"),
                    ),
                  ],
                ),
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
                // GestureDetector(
                //   onTap: () async {
                //     await isarController.deleteDefaultUser();
                //   },
                //   child: const ListTile(
                //     leading: Icon(Icons.heart_broken),
                //     title: Text("모든 데이터 삭제하기"),
                //   ),
                // ),
                GestureDetector(
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