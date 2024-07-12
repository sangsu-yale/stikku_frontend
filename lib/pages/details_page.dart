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
          Icon(Icons.download)
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
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: index == 0
                    ? const Column(
                        children: [
                          Row(
                            children: [
                              Text("삼성 라이온즈"),
                              Text("대구 한국가스공사 페가수스"),
                            ],
                          ),
                          Text("플레이오프1차전"),
                          Row(
                            children: [Text("103"), Text("/"), Text("88")],
                          ),
                          Row(
                            children: [
                              Text("DATE"),
                              Text("2024.06.30"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("GROUND"),
                              Text("잠실주경기장"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("SEAT"),
                              Text("200구역 12열 2번"),
                            ],
                          ),
                          Text("COMMENT"),
                          Text("이제서야 야구다운 야구를 하는구나")
                        ],
                      )
                    : const Column(
                        children: [
                          Column(
                            children: [Text("관람평"), Text("좋았다")],
                          ),
                          Column(
                            children: [Text("별점"), Text("별이 다슷개")],
                          ),
                          Column(
                            children: [Text("수훈선수"), Text("김도영")],
                          ),
                          Column(
                            children: [Text("직관음식"), Text("명물 크새")],
                          )
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
