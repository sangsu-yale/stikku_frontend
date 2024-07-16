import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/controllers/isar_controller.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';

class ListPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController =
      Get.put(ListTopSearchController());
  final IsarController isarController = Get.put(IsarController());

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // <------------- 검색 ZONE ------------->
          TextField(
            decoration: const InputDecoration(
              hintText: '검색',
            ),
            onChanged: (value) {
              listTopSearchController.updateSearchText(value);
            },
          ),

          // <------------- 필터 ZONE ------------->
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text("필터"),
                  Text("즐겨찾기"),
                ],
              ),
              Obx(() {
                return ElevatedButton(
                  onPressed: () {
                    listTopSearchController.sortByDate();
                  },
                  child: Row(
                    children: [
                      Icon(
                        listTopSearchController.isAscending.value
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined,
                      ),
                      const Text("최근순")
                    ],
                  ),
                );
              }),
            ],
          ),

          // 화면 설정 버튼
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.grid_3x3),
              Icon(Icons.ac_unit_outlined),
            ],
          ),

          // <------------- 카드 리스트 ZONE ------------->
          Expanded(
            child: Obx(() {
              final filterList = listTopSearchController.filteredList;
              return ListView.builder(
                itemCount: filterList.length,
                itemBuilder: (context, index) {
                  final item = filterList[index];
                  // 아이템 빌드 로직
                  return GestureDetector(
                    onTap: () async {
                      final gameResult =
                          await isarController.getDetails(item.date.toLocal());
                      Get.toNamed('/details', arguments: gameResult);
                    },
                    child: Container(
                      color: Colors.white,
                      margin: const EdgeInsets.all(10),
                      // 내용물 시작
                      child: Column(
                        children: [
                          // 경기 결과
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // 팀
                              Column(
                                children: [
                                  // 우리팀
                                  Row(
                                    children: [
                                      Text(item.team1),
                                      Text(item.score1),
                                    ],
                                  ),

                                  // 상대팀
                                  Row(
                                    children: [
                                      Text(item.team2),
                                      Text(item.score2),
                                    ],
                                  ),
                                ],
                              ),

                              // 승패 유무
                              Row(
                                children: [
                                  Text(item.result),
                                  const Icon(Icons.heart_broken),
                                ],
                              ),
                            ],
                          ),

                          // 경기 내용
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(DateFormat('yyyy.MM.dd').format(item.date)),
                              Text(item.stadium),
                              Text(item.seatLocation)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
