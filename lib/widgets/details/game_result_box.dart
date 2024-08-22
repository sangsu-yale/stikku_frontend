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
        flex: 5,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double cardHeight = constraints.maxHeight;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('yyyy년 MM월 dd일')
                            .format(gameResult.date!)
                            .toUpperCase(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(gameResult.team1!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: gameResult.team1!.length > 9
                                  ? cardHeight * 0.1 / 1.5
                                  : cardHeight * 0.1,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                      Text("vs",
                          style: TextStyle(
                              fontSize: cardHeight * 0.08,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color:
                                  (gameResult.result as GameResultType).color)),
                      Text(gameResult.team2!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: gameResult.team2!.length > 9
                                  ? cardHeight * 0.1 / 1.5
                                  : cardHeight * 0.1,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
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
                              color:
                                  (gameResult.result as GameResultType).color,
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
                            color: Colors.black, fontSize: cardHeight * 0.15),
                        children: <TextSpan>[
                          TextSpan(
                              text: gameResult.score1,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: ' : ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: gameResult.score2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
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
