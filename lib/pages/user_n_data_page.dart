import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/controllers/navigation_controller.dart';
import 'package:stikku_frontend/controllers/user_controller.dart';
import 'package:stikku_frontend/utils/functions.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

part '../widgets/userndata/parts/list.dart';
part '../widgets/userndata/parts/appbar.dart';

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
      appBar: const _Appbar(),
      body: _List(
          isarController: isarController,
          listTopSearchController: listTopSearchController,
          navigationController: navigationController,
          userController: userController),
    );
  }
}
