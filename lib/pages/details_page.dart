import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => {
                  // 생성 후 입장과 리스트 클릭 구분
                  Get.previousRoute == '/lists'
                      ? Get.back()
                      : Get.offAllNamed('/')
                },
            icon: const Icon(Icons.close)),
        title: const Text("카드 디테일 페이지"),
      ),
      body: const Center(
        child: Text("티켓입니다"),
      ),
    );
  }
}
