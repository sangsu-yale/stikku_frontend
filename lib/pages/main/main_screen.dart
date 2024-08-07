import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/navigation_controller.dart';
import 'package:stikku_frontend/pages/charts_page.dart';
import 'package:stikku_frontend/pages/home_page.dart';
import 'package:stikku_frontend/pages/list_page.dart';
import 'package:stikku_frontend/pages/settings_page.dart';
import 'package:stikku_frontend/widgets/bottomnavigation/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  // 내비게이션 컨트롤러

  final NavigationController navigationController =
      Get.put(NavigationController());

  // 페이지 리스트
  final List<Widget> pages = [
    HomePage(),
    ListPage(),
    ChartsPage(),
    SettingsPage()
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 페이지 화면
      body: Obx(() {
        // 인덱스 스택으로 상태 유지
        return IndexedStack(
          index: navigationController.selectedIndex.value,
          children: pages,
        );
      }),

      // <--- 바텀내비게이션바 --->
      bottomNavigationBar:
          MainBottomNavigationBar(navigationController: navigationController),
    );
  }
}
