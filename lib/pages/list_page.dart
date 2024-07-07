import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 검색
          const TextField(
            decoration: InputDecoration(
              hintText: '검색',
            ),
          ),

          // 필터 Zone
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

          // 리스트 뷰
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                // 아이템 빌드 로직
                return InkWell(
                  onTap: () => Get.toNamed('/details'),
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    // 내용물 시작
                    child: const Column(
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
                                    Text("삼성 라이온즈"),
                                    Text("3"),
                                  ],
                                ),

                                // 상대팀
                                Row(
                                  children: [
                                    Text("한화 이글스"),
                                    Text("3"),
                                  ],
                                ),
                              ],
                            ),

                            // 승패 유무
                            Row(
                              children: [
                                Text("WIN"),
                                Icon(Icons.heart_broken),
                              ],
                            ),
                          ],
                        ),

                        // 경기 내용
                        Row(
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
            ),
          ),
        ],
      ),
    );
  }
}
