import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("리스트 페이지"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => Get.toNamed('/details'),
            child: const Text("티켓 리스트 1")),
      ),
    );
  }
}
