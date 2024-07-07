import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.85);

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
        actions: const [
          Icon(Icons.delete),
          Icon(Icons.edit),
          Icon(Icons.add_box)
        ],
      ),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.black,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
