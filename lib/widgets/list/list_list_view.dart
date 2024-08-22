import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/constants/result_enum.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/functions.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/utils/ticket_clipper.dart';

class ListViewZone extends StatelessWidget {
  const ListViewZone({
    super.key,
    required this.filterList,
    required this.isarController,
    required this.listTopSearchController,
  });

  final List<GameResult> filterList;
  final IsarService isarController;
  final ListTopSearchController listTopSearchController;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.14;
    print(height / 13);
    return ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        final item = filterList[index];

        return GestureDetector(
          onTap: () async {
            await goToDetails(isarController, item.date!.toLocal());
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Stack(
                  children: <Widget>[
                    CustomPaint(
                      painter: BorderPainter(),
                      child: SizedBox(
                        height: height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    ClipPath(
                      clipper: TicketClipper(),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: height,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Container(
                                    color: Colors.white,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // 경기 결과
                                          Row(
                                            children: [
                                              // 팀
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: height / 10,
                                                      vertical: height / 13),
                                                  child: Column(
                                                    children: [
                                                      // 우리팀
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            item.team1!,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    item.team1!.length >
                                                                            9
                                                                        ? 11
                                                                        : null,
                                                                fontWeight: item
                                                                        .team1IsMyTeam
                                                                    ? FontWeight
                                                                        .w900
                                                                    : null),
                                                          ),
                                                          Text(
                                                            item.score1!,
                                                            style: TextStyle(
                                                                fontWeight: item
                                                                        .team1IsMyTeam
                                                                    ? FontWeight
                                                                        .w900
                                                                    : null),
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                        height: 5,
                                                      ),

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            item.team2!,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    item.team1!.length >
                                                                            9
                                                                        ? 11
                                                                        : null,
                                                                fontWeight: item
                                                                        .team2IsMyTeam
                                                                    ? FontWeight
                                                                        .w900
                                                                    : null),
                                                          ),
                                                          Text(
                                                            item.score2!,
                                                            style: TextStyle(
                                                                fontWeight: item
                                                                        .team2IsMyTeam
                                                                    ? FontWeight
                                                                        .w900
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
                                                    color: const Color.fromARGB(
                                                        255, 240, 240, 240),
                                                    border: Border(
                                                      left: BorderSide(
                                                        color: (item.result
                                                                as GameResultType)
                                                            .color, // 경계 색상
                                                        width: 3.0, // 경계 두께
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          (item.result
                                                                  as GameResultType)
                                                              .name,
                                                          style: TextStyle(
                                                              color: (item.result
                                                                      as GameResultType)
                                                                  .color,
                                                              fontSize: 23,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                        // 좋아요 유무
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 10),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              listTopSearchController
                                                                  .toggleFavorite(
                                                                      item.id);
                                                            },
                                                            child: Icon(
                                                              item.isFavorite
                                                                  ? Custom
                                                                      .heartstraight_1
                                                                  : Custom
                                                                      .heartstraight,
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
                                        ]))),
                            const Divider(
                              thickness: 1,
                              height: 1,
                              color: Color.fromARGB(139, 255, 255, 255),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                        fit: FlexFit.loose,
                                        flex: 2,
                                        child: Text(
                                          DateFormat('yyyy.MM.dd')
                                              .format(item.date!),
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      flex: 3,
                                      child: Text(
                                        style: const TextStyle(
                                            color: Colors.black54),
                                        item.stadium!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
