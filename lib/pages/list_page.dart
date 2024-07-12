import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';

// aqua33y확인할것

class ListPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController =
      Get.put(ListTopSearchController());

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
              print(value);
              listTopSearchController.updateSearchText(value);
            },
          ),

          // <------------- 필터 ZONE ------------->
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("필터"),
                  Text("즐겨찾기"),
                ],
              ),
              Text("정렬순")
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
              // searchController.searchText;
              final filterList = listTopSearchController.filteredList;
              return ListView.builder(
                itemCount: filterList.length,
                itemBuilder: (context, index) {
                  final item = filterList[index];
                  // 아이템 빌드 로직
                  return InkWell(
                    onTap: () => Get.toNamed('/details'),
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
                                      Text(item['homeTeam']),
                                      Text(item['homeScore'].toString()),
                                    ],
                                  ),

                                  // 상대팀
                                  Row(
                                    children: [
                                      Text(item['awayTeam']),
                                      const Text("3"),
                                    ],
                                  ),
                                ],
                              ),

                              // 승패 유무
                              const Row(
                                children: [
                                  Text("WIN"),
                                  Icon(Icons.heart_broken),
                                ],
                              ),
                            ],
                          ),

                          // 경기 내용
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("2024.05.30"),
                              Text("한화 이글스파크"),
                              Text("버건디 112구역 12번")
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
