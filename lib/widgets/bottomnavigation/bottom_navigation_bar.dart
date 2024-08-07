import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/navigation_controller.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    required this.navigationController,
  });

  final NavigationController navigationController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          destinations: <Widget>[
            _navigationDestination(
                Custom.baseballhelmet_1, Custom.baseballhelmet, '메인'),
            _navigationDestination(
                Custom.listheart__1_, Custom.listheart__2_, '리스트'),
            _navigationDestination(Custom.lego_1, Custom.lego, '통계'),
            _navigationDestination(Custom.asterisk_1, Custom.asterisk, '설정'),
          ],
        ),
      );
    });
  }

  NavigationDestination _navigationDestination(
      IconData selectIcon, IconData unSelectIcon, String label) {
    return NavigationDestination(
      selectedIcon: Icon(
        selectIcon,
        color: Colors.blue,
        size: 27,
      ),
      icon: Icon(
        unSelectIcon,
        size: 27,
      ),
      label: label,
    );
  }
}
