part of '../../widgets/details/front_view.dart';

class _GameDataBox extends StatelessWidget {
  const _GameDataBox({
    required this.gameResult,
  });

  final GameResult gameResult;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      fit: FlexFit.loose, // 최소한의 공간만 확인
      child: LayoutBuilder(builder: (context, constraints) {
        var boxHeight = constraints.maxHeight;

        return Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.5),
            ),
          ),
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
                        text: DateFormat('yyyy.MM.dd').format(gameResult.date),
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
                                  gameResult.stadium.length > 30 ? 13 : null)),
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
                              fontSize: gameResult.seatLocation.length > 30
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(gameResult.comment!.isNotEmpty ? "COMMENT" : '',
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
    );
  }
}
