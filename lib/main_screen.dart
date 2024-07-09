import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/navigation_controller.dart';
import 'package:stikku_frontend/pages/charts_page.dart';
import 'package:stikku_frontend/pages/home_page.dart';
import 'package:stikku_frontend/pages/list_page.dart';
import 'package:stikku_frontend/pages/settings_page.dart';

class MainScreen extends StatelessWidget {
  // 내비게이션 컨트롤러
  final NavigationController navigationController =
      Get.put(NavigationController());

  // 페이지 리스트
  final List<Widget> pages = [
    HomePage(),
    const ListPage(),
    const ChartsPage(),
    const SettingsPage()
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 페이지 화면
      body: LayoutBuilder(builder: (context, constraints) {
        double paddingValue = constraints.maxWidth * 0.03; // 화면 너비의 3%를 패딩으로 사용
        return Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Obx(() {
            // 인덱스 스택으로 상태 유지
            return IndexedStack(
              index: navigationController.selectedIndex.value,
              children: pages,
            );
          }),
        );
      }),

      // <--- 바텀내비게이션바 --->
      bottomNavigationBar: Obx(() {
        // 둥근 모서리 정의
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),

          // <--- 내비게이션바 --->
          child: NavigationBar(
            // 내비게이션바 설정
            onDestinationSelected: (int index) {
              navigationController.changePage(index);
            },
            selectedIndex: navigationController.selectedIndex.value,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 0,

            // 내비게이션바 위젯 리스트
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.calendar_month),
                icon: Icon(Icons.calendar_month_outlined),
                label: '메인',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.view_list),
                icon: Icon(Icons.view_list_outlined),
                label: '리스트',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.chair),
                icon: Icon(Icons.chair_outlined),
                label: '통계',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings),
                label: '설정',
              ),
            ],
          ),
        );
      }),
    );
  }
}
