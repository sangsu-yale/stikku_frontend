import 'package:flutter/material.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/models/game_result_model.dart';

class BackView extends StatelessWidget {
  const BackView({
    super.key,
    required this.gameResult,
    required this.smallSize,
  });

  final GameResult gameResult;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    // final gameReview = gameResult.gameReview;
    // var fieldsInfo = gameReview!
    //     .getFieldsInfo()
    //     .where((entry) =>
    //         entry.values.last != '' &&
    //         entry.values.last != 0 &&
    //         entry.values.last != null)
    //     .toList();

    final moods = {
      'HAPPY': Custom.smiley_1,
      'SURPRISED': Custom.smileyxeyes_1,
      'MAD': Custom.smileyangry_1,
      'BORED': Custom.smileyblank_1,
      'FUN': Custom.smileywink_1
    };

    return Container(
        padding: const EdgeInsets.all(20),
        child:
            // fieldsInfo.isEmpty ?
            const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "오늘의 경기 리뷰는\n작성하지 않았어요",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black38),
            )
          ],
        )
        // : Column(
        //     children: List.generate(fieldsInfo.length, (index) {
        //       var field = fieldsInfo[index].values.first;
        //       var fieldData = fieldsInfo[index].values.last;

        //       const textStyle = TextStyle(
        //           fontSize: 20,
        //           fontStyle: FontStyle.italic,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.blue,
        //           letterSpacing: 1.5);

        //       Widget widgetField;

        //       switch (field) {
        //         case 'review':
        //           widgetField = PaddedTextWidget(
        //               childWidget: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [Text(fieldData)],
        //           ));
        //           break;
        //         case 'mood':
        //           widgetField = PaddedTextWidget(
        //             childWidget: Container(
        //               alignment: Alignment.bottomRight,
        //               child: Transform.rotate(
        //                 angle: 0.2,
        //                 child: Icon(
        //                   moods[fieldData],
        //                   size: 90,
        //                   color: Colors.blue[200],
        //                 ),
        //               ),
        //             ),
        //           );
        //           break;
        //         case 'food':
        //           widgetField = PaddedTextWidget(
        //               childWidget: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Divider(),
        //               const Text(
        //                 "TODAY FOOD",
        //                 style: textStyle,
        //               ),
        //               Text(fieldData),
        //             ],
        //           ));
        //           break;
        //         case 'rating':
        //           widgetField = PaddedTextWidget(
        //               childWidget: Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: List.generate(
        //                 fieldData,
        //                 (int i) => const Icon(
        //                       Custom.star_1,
        //                       color: Colors.blue,
        //                     )),
        //           ));
        //           break;
        //         case 'playerOfTheMatch':
        //           widgetField = PaddedTextWidget(
        //               childWidget: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Divider(),
        //               const Text(
        //                 "BEST PLAYER",
        //                 style: textStyle,
        //               ),
        //               Text(fieldData),
        //             ],
        //           ));
        //           break;

        //         default:
        //           widgetField = const Text("텅~");
        //       }

        //       return widgetField;
        //     }),
        //   ),
        );
  }
}

class PaddedTextWidget extends StatelessWidget {
  final Widget childWidget;

  const PaddedTextWidget({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [childWidget],
        ),
      ),
    );
  }
}
