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
  const UserNDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Appbar(),
      body: _List(),
    );
  }
}
