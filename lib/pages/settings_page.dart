import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/controllers/user_controller.dart';

part '../widgets/settings/parts/profile.dart';
part '../widgets/settings/parts/settings.dart';

class SettingsPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController = Get.find();
  final UserController userController = Get.put(UserController());

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _Profile(userController: userController),
          const Divider(),
          const _Settings(),
        ],
      ),
    );
  }
}
