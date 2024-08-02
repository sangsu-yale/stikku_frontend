part of '../../widgets/details/front_view.dart';

class _GameResultBox extends StatelessWidget {
  const _GameResultBox({required this.gameResult, required this.smallSize});

  final GameResult gameResult;
  final bool smallSize;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Flexible(
        flex: 5, // 작은 것 처리
        child: LayoutBuilder(
          // flex의 크기
          builder: (context, constraints) {
            double cardHeight = constraints.maxHeight;
            double cardWidth = constraints.maxWidth;
            //  print(cardHeight * 0.05); // 280
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      Text(gameResult.team1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: gameResult.team1.length > 9
                                  ? cardWidth * 0.1 / 1.5
                                  : cardWidth * 0.1,
                              fontWeight: FontWeight.bold)),
                      Text("vs", style: TextStyle(fontSize: cardWidth * 0.1)),
                      Text(gameResult.team2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: gameResult.team2.length > 9
                                  ? cardWidth * 0.1 / 1.5
                                  : cardWidth * 0.1,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: cardHeight * 0.05, // 5퍼센트
                ),
                Column(
                  children: [
                    gameResult.gameTitle!.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 7),
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.5, horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              gameResult.gameTitle ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: cardHeight / 30),
                            ),
                          )
                        : const SizedBox(),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontSize: cardWidth * 0.15),
                        children: <TextSpan>[
                          TextSpan(text: gameResult.score1),
                          const TextSpan(text: ' : '),
                          TextSpan(text: gameResult.score2),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
