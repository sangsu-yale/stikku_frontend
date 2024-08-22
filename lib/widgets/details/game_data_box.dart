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

        return SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              const Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: FieldTitle(title: 'FIELD'),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: FieldTitle(title: 'SEAT'),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: FieldItem(
                      height: boxHeight / 2.5,
                      item: gameResult.stadium!,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                    height: boxHeight / 4,
                    child: const VerticalDivider(
                      color: Colors.black12,
                      thickness: 1, // 선의 두께
                      width: 1,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: FieldItem(
                      height: boxHeight / 2.5,
                      item: gameResult.seatLocation!,
                    ),
                  ),
                ],
              ),
              gameResult.comment!.isNotEmpty
                  ? Expanded(
                      child: Column(
                        children: [
                          const DottedSeparator(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: ClipRect(
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: const Size(
                                        double.infinity, double.infinity),
                                    painter: TextPatternPainter(
                                        text: (gameResult.result
                                                as GameResultType)
                                            .name),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 5,
                                          color: (gameResult.result
                                                  as GameResultType)
                                              .color,
                                        ),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            textScaler: boxHeight / 2.5 < 56
                                                ? const TextScaler.linear(0.8)
                                                : null,
                                            "COMMENT",
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                              color: (gameResult.result
                                                      as GameResultType)
                                                  .color,
                                            ),
                                          ),
                                          Text(
                                            textScaler: boxHeight / 2.5 < 56
                                                ? const TextScaler.linear(0.8)
                                                : null,
                                            "${gameResult.comment}",
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
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
                  : Expanded(
                      child: Column(
                        children: [
                          const DottedSeparator(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: ClipRect(
                              child: Stack(
                                children: [
                                  CustomPaint(
                                    size: const Size(
                                        double.infinity, double.infinity),
                                    painter: TextPatternPainter(
                                        text: (gameResult.result
                                                as GameResultType)
                                            .name),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 5,
                                          color: (gameResult.result
                                                  as GameResultType)
                                              .color,
                                        ),
                                      ),
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                textScaler: boxHeight / 2.5 < 56
                                                    ? const TextScaler.linear(
                                                        0.8)
                                                    : null,
                                                DateFormat('yyyy년 MM월 dd일')
                                                    .format(gameResult.date!)
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              Text(
                                                textScaler: boxHeight / 2.5 < 56
                                                    ? const TextScaler.linear(
                                                        0.8)
                                                    : null,
                                                "${gameResult.team1} vs ${gameResult.team2}",
                                                style: const TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              Text(
                                                textScaler: boxHeight / 2.5 < 56
                                                    ? const TextScaler.linear(
                                                        0.8)
                                                    : null,
                                                "${gameResult.seatLocation}",
                                                style: const TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
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
        );
      }),
    );
  }
}

class TicketDivider extends StatelessWidget {
  const TicketDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5, // 선의 두께
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "✦", // 가운데 텍스트
            style: TextStyle(
              fontSize: 20,
              color: Colors.black12,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 0.5, // 선의 두께
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}

class FieldItem extends StatelessWidget {
  const FieldItem({super.key, required this.item, required this.height});

  final String item;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(item,
              textScaler: height < 56 ? const TextScaler.linear(0.8) : null,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: true)
        ],
      ),
    );
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black87,
      child: Text(
        title,
        style: const TextStyle(
            letterSpacing: 5,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    );
  }
}
