import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final GameResult gameResult = Get.arguments!;
  final isarController = Get.find<IsarService>();

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
        actions: [
          IconButton(
            onPressed: () async {
              Get.defaultDialog(
                title: "정말 삭제하시겠습니까?",
                middleText: "이 작업은 되돌릴 수 없습니다.",
                textConfirm: "확인",
                textCancel: "취소",
                confirmTextColor: Colors.white,
                onConfirm: () async {
                  await isarController.deleteDetails(gameResult.date);
                  Get.offAndToNamed('/list');
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                // 추가
              },
              icon: const Icon(Icons.download)),
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
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Text(gameResult.team1),
                              Text(gameResult.team2),
                            ],
                          ),
                          Text(gameResult.gameTitle ?? ''),
                          Row(
                            children: [
                              Text(gameResult.score1),
                              const Text("/"),
                              Text(gameResult.score2)
                            ],
                          ),
                          Row(
                            children: [
                              const Text("DATE"),
                              Text(gameResult.date.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              const Text("GROUND"),
                              Text(gameResult.stadium),
                            ],
                          ),
                          Row(
                            children: [
                              const Text("SEAT"),
                              Text(gameResult.seatLocation),
                            ],
                          ),
                          const Text("COMMENT"),
                          Text(gameResult.comment ?? '')
                        ],
                      )
                    : Column(
                        children: [
                          Column(
                            children: [
                              const Text("관람평"),
                              Text(gameResult.reviewComment ?? "")
                            ],
                          ),
                          const Column(
                            children: [Text("별점"), Text("별이 다슷개")],
                          ),
                          const Column(
                            children: [Text("수훈선수"), Text("김도영")],
                          ),
                          Column(
                            children: [
                              const Text("직관음식"),
                              Text(gameResult.food ?? "")
                            ],
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
