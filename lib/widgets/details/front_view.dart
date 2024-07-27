import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:widget_marquee/widget_marquee.dart';

part '../details/game_data_box.dart';
part '../details/game_pic_box.dart';
part '../details/game_result_box.dart';
part '../details/marquee.dart';

class FrontView extends StatelessWidget {
  const FrontView({
    super.key,
    required this.gameResult,
    required this.smallSize,
  });

  final GameResult gameResult;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Marquee(gameResult: gameResult),

        // 경기 결과
        _GameResultBox(gameResult: gameResult, smallSize: smallSize),
        // 경기 내용
        _GameDataBox(gameResult: gameResult),
        // 사진
        const _GamePicBox(),
      ],
    );
  }
}
