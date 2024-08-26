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
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: ShadowPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: ClipPath(
              clipper: DiaryTicketClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: pageIndex == 0
                    ? FrontView(gameResult: gameResult, smallSize: smallSize)
                    : BackView(gameReview: gameReview, smallSize: smallSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
