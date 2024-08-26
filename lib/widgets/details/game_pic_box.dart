part of '../../widgets/details/front_view.dart';

class _GamePicBox extends StatelessWidget {
  const _GamePicBox({required this.gameResult});
  final GameResult gameResult;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 3,
        child:
            gameResult.pictureLocalPath != null || gameResult.pictureUrl != null
                ? Column(
                    children: [
                      const DottedSeparator(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Flexible(
                        child: Opacity(
                          opacity: 0.9,
                          child: gameResult.pictureLocalPath != null
                              ? Image.file(
                                  File(gameResult.pictureLocalPath!),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                )
                              : Image.network(gameResult.pictureUrl!,
                                  fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const DottedSeparator(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Flexible(
                        child: Opacity(
                          opacity: 0.5,
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.matrix([
                              0.2126, 0.7152, 0.0722, 0, 0, // Red channel
                              0.2126, 0.7152, 0.0722, 0, 0, // Green channel
                              0.2126, 0.7152, 0.0722, 0, 0, // Blue channel
                              0, 0, 0, 1, 0, // Alpha channel
                            ]),
                            child: Image.asset(
                              'assets/icon/icon.png',
                              fit: BoxFit.contain,
                              width: 100,
                              height: double.infinity,
                            ),
                          ),
                        ), // 이미지 경로 설정
                      )
                    ],
                  ));
  }
}
