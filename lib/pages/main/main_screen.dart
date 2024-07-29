import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
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
    ListPage(),
    ChartsPage(),
    SettingsPage()
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 페이지 화면
      body: LayoutBuilder(builder: (context, constraints) {
        return Obx(() {
          // 인덱스 스택으로 상태 유지
          return IndexedStack(
            index: navigationController.selectedIndex.value,
            children: pages,
          );
        });
      }),

      // <--- 바텀내비게이션바 --->
      bottomNavigationBar: Obx(() {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color.fromARGB(28, 0, 0, 0)),
            ),
          ),
          child: NavigationBar(
            // 내비게이션바 설정
            onDestinationSelected: (int index) {
              navigationController.changePage(index);
            },
            selectedIndex: navigationController.selectedIndex.value,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            elevation: 1,
            indicatorColor: Colors.transparent,
            // 내비게이션바 위젯 리스트
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Custom.baseballhelmet_1,
                  color: Colors.blue,
                  size: 27,
                ),
                icon: Icon(
                  Custom.baseballhelmet,
                  size: 27,
                ),
                label: '메인',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Custom.listheart__1_,
                  color: Colors.blue,
                  size: 27,
                ),
                icon: Icon(
                  Custom.listheart__2_,
                  size: 27,
                ),
                label: '리스트',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Custom.lego_1,
                  color: Colors.blue,
                  size: 27,
                ),
                icon: Icon(
                  Custom.lego,
                  size: 27,
                ),
                label: '통계',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Custom.asterisk_1,
                  color: Colors.blue,
                  size: 27,
                ),
                icon: Icon(
                  Custom.asterisk,
                  size: 27,
                ),
                label: '설정',
              ),
            ],
          ),
        );
      }),
    );
  }
}
