import 'package:flutter/material.dart';
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
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(),
              ),
              child: Text("${gameResult.gameReview?.rating}"),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  border: Border.symmetric(vertical: BorderSide())),
              child: const Text("직관음식, 수훈선수"),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(),
              ),
              // child: const Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
