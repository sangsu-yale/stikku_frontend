import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class ListViewZone extends StatelessWidget {
  ListViewZone({
    super.key,
    required this.filterList,
    required this.isarController,
    required this.listTopSearchController,
  });

  final List<GameResult> filterList;
  final IsarService isarController;
  final ListTopSearchController listTopSearchController;

  final List<String> resultColor = ['win', 'lose', 'tie', 'cancel'];
  final colorMap = {
    'win': Colors.blue,
    'lose': Colors.red,
    'tie': Colors.grey,
    'cancel': Colors.orange,
  };

  @override
  Widget build(BuildContext context) {
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(31, 134, 134, 134), // 그림자 색상과 투명도
                  spreadRadius: 1, // 그림자가 퍼지는 정도
                  blurRadius: 4, // 그림자의 흐림 정도
                  offset: Offset(0, 0), // 그림자의 위치 (x, y)
                ),
              ],
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                // 경기 결과
                Row(
                  children: [
                    // 팀
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            // 우리팀
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.team1,
                                  style: TextStyle(
                                      fontSize:
                                          item.team1.length > 9 ? 10 : null,
                                      fontWeight: item.team1IsMyTeam
                                          ? FontWeight.w900
                                          : null),
                                ),
                                Text(
                                  item.score1,
                                  style: TextStyle(
                                      fontWeight: item.team1IsMyTeam
                                          ? FontWeight.w900
                                          : null),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 5,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.team2,
                                  style: TextStyle(
                                      fontSize:
                                          item.team1.length > 9 ? 10 : null,
                                      fontWeight: item.team2IsMyTeam
                                          ? FontWeight.w900
                                          : null),
                                ),
                                Text(
                                  item.score2,
                                  style: TextStyle(
                                      fontWeight: item.team2IsMyTeam
                                          ? FontWeight.w900
                                          : null),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 승패 유무
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 240, 240, 240),
                          border: Border(
                            left: BorderSide(
                              color:
                                  colorMap[item.result] ?? Colors.grey, // 경계 색상
                              width: 3.0, // 경계 두께
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.result.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.black12,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w300),
                              ),
                              // 좋아요 유무
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    listTopSearchController
                                        .toggleFavorite(item.id);
                                  },
                                  child: Icon(
                                    item.isFavorite
                                        ? Custom.heartstraight_1
                                        : Custom.heartstraight,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // 경기 내용
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: BorderDirectional(
                      top: BorderSide(
                        color: Color.fromARGB(255, 224, 224, 224), // 경계 색상
                        width: 0.5, // 경계 두께
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(DateFormat('yyyy.MM.dd').format(item.date)),
                      Text(item.stadium),
                      Text(item.seatLocation)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
