import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/write_form_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/pages/write_page.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:widget_marquee/widget_marquee.dart';

part '../widgets/details/appbar.dart';
part '../widgets/details/game_result_box.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  final GameResult gameResult = Get.arguments!;
  final isarController = Get.find<IsarService>();
  final formController = Get.find<FormController>();

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 0, viewportFraction: 0.85);
    final smallSize = MediaQuery.of(context).size.height < 700;

    return Scaffold(
      appBar: _AppBar(formController: formController, gameResult: gameResult),
      body: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              elevation: 4.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Column(
                  children: [
                    _Marquee(gameResult: gameResult),

                    // 경기 결과
                    _GameResultBox(
                        gameResult: gameResult, smallSize: smallSize),
                    // 경기 내용
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose, // 최소한의 공간만 확인
                      child: LayoutBuilder(builder: (context, constraints) {
                        var boxHeight = constraints.maxHeight;

                        return Container(
                          padding: const EdgeInsets.all(10),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'DATE : ',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      TextSpan(
                                        text: DateFormat('yyyy.MM.dd')
                                            .format(gameResult.date),
                                      ),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'GROUND : ', // 기본 스타일의 텍스트
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      TextSpan(
                                          text: gameResult.stadium,
                                          style: TextStyle(
                                              fontSize:
                                                  gameResult.stadium.length > 30
                                                      ? 13
                                                      : null)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'SEAT : ', // 기본 스타일의 텍스트
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      TextSpan(
                                          text: gameResult.seatLocation,
                                          style: TextStyle(
                                              fontSize: gameResult
                                                          .seatLocation.length >
                                                      30
                                                  ? 12
                                                  : null)),
                                    ]),
                              ),
                              SizedBox(
                                height: boxHeight / 11,
                              ),
                              // 코멘트
                              gameResult.comment!.isNotEmpty
                                  ? Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              gameResult.comment!.isNotEmpty
                                                  ? "COMMENT"
                                                  : '',
                                              style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                              )),
                                          Text(gameResult.comment ?? '',
                                              style: const TextStyle())
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        );
                      }),
                    ),
                    // 사진
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.black, // Border 색상
                              width: 4.0, // Border 두께
                            ),
                          ),
                        ),
                        width: double.maxFinite,
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Image.asset(
                            'assets/images/pic.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // TextStyle _teamNameStyle(team, cardWidth) {
  //   var length = team.length.toDouble();
  //   return TextStyle(
  //       fontSize: length > 9 ? cardWidth * 0.1 / 1.5 : cardWidth * 0.1,
  //       fontWeight: FontWeight.bold);
  // }
}

class _Marquee extends StatelessWidget {
  const _Marquee({
    required this.gameResult,
  });

  final GameResult gameResult;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Marquee(
        delay: const Duration(milliseconds: 0000),
        disableAnimation: true,
        gap: 0,
        duration: const Duration(seconds: 20),
        pause: const Duration(milliseconds: 0000),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 0, 102, 185)),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "${gameResult.result.toUpperCase()} " * 20,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02, // 스크린 길이의 2%
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ));
  }
}
