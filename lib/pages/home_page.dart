import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          Get.toNamed('/write');
        }, // 경기 기록 작성으로 넘어감
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
