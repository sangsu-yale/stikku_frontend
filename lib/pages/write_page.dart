import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends StatelessWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("경기 기록 작성 페이지"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const TextField(),
            TextButton(
              onPressed: () => Get.toNamed('/diary'),
              child: const Text("다음으로"),
            ),
          ],
        ),
      ),
    );
  }
}
