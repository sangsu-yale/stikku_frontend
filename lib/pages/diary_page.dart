import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("추가 기록 작성 페이지"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => Get.offAllNamed('/details'),
            child: const Text("확인")),
      ),
    );
  }
}
