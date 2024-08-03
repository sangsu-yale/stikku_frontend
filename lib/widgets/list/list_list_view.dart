import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/dotted_separator.dart';
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

        return GestureDetector(
          onTap: () async {
            final gameResult =
                await isarController.getDetails(item.date.toLocal());
            Get.toNamed('/details', arguments: gameResult);
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                PhysicalShape(
                  elevation: 1,
                  color: Colors.white,
                  clipper: TicketClipper(),
                  child: Stack(
                    children: <Widget>[
                      CustomPaint(
                        painter: BorderPainter(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      ClipPath(
                        clipper: TicketClipper(),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: Container(
                                      color: Colors.white,
                                      child: Column(children: [
                                        // 경기 결과
                                        Row(
                                          children: [
                                            // 팀
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  children: [
                                                    // 우리팀
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          item.team1,
                                                          style: TextStyle(
                                                              fontSize: item
                                                                          .team1
                                                                          .length >
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
                                                          item.score1,
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
                                                          item.team2,
                                                          style: TextStyle(
                                                              fontSize: item
                                                                          .team1
                                                                          .length >
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
                                                          item.score2,
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
                                                      color: colorMap[
                                                              item.result] ??
                                                          Colors.grey, // 경계 색상
                                                      width: 3.0, // 경계 두께
                                                    ),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        item.result
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: colorMap[item
                                                                    .result] ??
                                                                Colors.grey,
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
                                                        child: GestureDetector(
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
                              const DottedSeparator(color: Colors.grey),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.lightBlue,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          flex: 2,
                                          child: Text(
                                            DateFormat('yyyy.MM.dd')
                                                .format(item.date),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        flex: 3,
                                        child: Text(
                                          style: const TextStyle(
                                              color: Colors.white),
                                          item.stadium,
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
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // 좌측 상단 모서리
    path.moveTo(10.0, 0.0);
    path.lineTo(5.0, 0.0);
    path.relativeArcToPoint(const Offset(-5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 좌측 중간 아치
    path.lineTo(0.0, size.height * 3 / 5);
    path.relativeArcToPoint(const Offset(0, 17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 좌측 하단 모서리
    path.lineTo(0.0, size.height - 5);
    path.relativeArcToPoint(const Offset(5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 하단 모서리
    path.lineTo(size.width - 5, size.height);
    path.relativeArcToPoint(const Offset(5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 중간 아치
    path.lineTo(size.width, size.height * 3 / 5 + 16);
    path.relativeArcToPoint(const Offset(0, -17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 우측 상단 모서리
    path.lineTo(size.width, 5.0);
    path.relativeArcToPoint(const Offset(-5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    path.lineTo(10.0, 0.0);
    path.relativeArcToPoint(const Offset(0, 0),
        radius: const Radius.circular(10.0), largeArc: false, clockwise: false);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 그림자에 사용할 페인트
    Paint shadowPaint = Paint()
      ..color = const Color.fromARGB(90, 121, 121, 121) // 그림자 색상 및 투명도 설정
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5); // 블러 효과

    // 실제 모양에 사용할 페인트
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = const Color.fromARGB(255, 219, 219, 219);

    // 그림자의 경로 (바깥쪽)
    Path shadowPath = Path();
    shadowPath.moveTo(0, 0.0); // 오른쪽으로 5, 위로 -5만큼 이동
    shadowPath.lineTo(5.0, 0.0);
    shadowPath.relativeArcToPoint(const Offset(-5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(5.0 - 5, size.height * 3 / 5);
    shadowPath.relativeArcToPoint(const Offset(0, 17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    shadowPath.lineTo(5.0 - 5, size.height - 10 + 5);
    shadowPath.relativeArcToPoint(const Offset(5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(size.width - 10 + 5, size.height - 5 + 5);
    shadowPath.relativeArcToPoint(const Offset(5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(size.width - 5 + 5, size.height * 3 / 5 + 25 - 5);
    shadowPath.relativeArcToPoint(const Offset(0, -20),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    shadowPath.lineTo(size.width - 5 + 5, 10.0 - 5);
    shadowPath.relativeArcToPoint(const Offset(-5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    shadowPath.lineTo(15.0 + 5, 5.0 - 5);

    // 그림자 그리기
    canvas.drawPath(shadowPath, shadowPaint);

    // 원래 모양의 경로
    Path path = Path();
    path.moveTo(10.0, 0.0);
    path.lineTo(5.0, 0.0);
    path.relativeArcToPoint(const Offset(-5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 좌측 중간 아치
    path.lineTo(0.0, size.height * 3 / 5);
    path.relativeArcToPoint(const Offset(0, 17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 좌측 하단 모서리
    path.lineTo(0.0, size.height - 5);
    path.relativeArcToPoint(const Offset(5, 5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 하단 모서리
    path.lineTo(size.width - 5, size.height);
    path.relativeArcToPoint(const Offset(5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    // 우측 중간 아치
    path.lineTo(size.width, size.height * 3 / 5 + 16);
    path.relativeArcToPoint(const Offset(0, -17),
        radius: const Radius.circular(5.0), largeArc: false, clockwise: true);

    // 우측 상단 모서리
    path.lineTo(size.width, 5.0);
    path.relativeArcToPoint(const Offset(-5, -5),
        radius: const Radius.circular(5), largeArc: false, clockwise: true);

    path.lineTo(10.0, 0.0);
    path.relativeArcToPoint(const Offset(0, 0),
        radius: const Radius.circular(10.0), largeArc: false, clockwise: false);

    path.close();

    // 모양 그리기
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
