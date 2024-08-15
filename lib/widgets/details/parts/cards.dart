part of '../../../pages/details_page.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.cardKeys,
    required this.gameResult,
    required this.smallSize,
    required this.gameReview,
    required this.pageIndex,
  });

  final List<GlobalKey<State<StatefulWidget>>> cardKeys;
  final GameResult gameResult;
  final bool smallSize;
  final GameReview gameReview;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: cardKeys[pageIndex],
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        elevation: 4.0,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: pageIndex == 0
                ? FrontView(gameResult: gameResult, smallSize: smallSize)
                : BackView(gameReview: gameReview, smallSize: smallSize)),
      ),
    );
  }
}
