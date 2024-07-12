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

              // GestureDetector(
              //   onTap: () {
              //     if (listTopSearchController.isNew.value) {
              //       listTopSearchController.sortByDate(ascending: false);
              //       listTopSearchController.isNew.value = false;
              //     } else {
              //       listTopSearchController.sortByDate(ascending: true);
              //       listTopSearchController.isNew.value = true;
              //     }
              //   },
              //   child: Row(
              //     children: [
              //       Obx(() {
              //         return Icon(listTopSearchController.isNew.value
              //             ? Icons.arrow_drop_up_outlined
              //             : Icons.arrow_drop_down_outlined);
              //       }),
              //       const Text("정렬순"),
              //     ],
              //   ),
              // )
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
                                      Text(item['awayScore']),
                                    ],
                                  ),
                                ],
                              ),

                              // 승패 유무
                              Row(
                                children: [
                                  Text(item['result']),
                                  const Icon(Icons.heart_broken),
                                ],
                              ),
                            ],
                          ),

                          // 경기 내용
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(item['date']),
                              const Text("한화 이글스파크"),
                              const Text("버건디 112구역 12번")
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


// ADV : 즐겨찾기 버튼
// ADV : 필터 기능
// ADV : View 설정

/// 기능
/// 
/// ✅ 검색 기능
/// ✅ 최근/오래된순 설정