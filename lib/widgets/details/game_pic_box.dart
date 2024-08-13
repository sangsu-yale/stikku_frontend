part of '../../widgets/details/front_view.dart';

class _GamePicBox extends StatelessWidget {
  const _GamePicBox({required this.gameResult});
  final GameResult gameResult;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 3,
        child: gameResult.pictureLocalPath != null
            ? Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black, // Border 색상
                      width: 4.0, // Border 두께
                    ),
                  ),
                ),
                width: double.maxFinite,
                child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.file(File(gameResult.pictureLocalPath!),
                        fit: BoxFit.cover)),
              )
            : const SizedBox());
  }
}
