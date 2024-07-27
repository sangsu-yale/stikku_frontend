part of '../../widgets/details/front_view.dart';

class _GamePicBox extends StatelessWidget {
  const _GamePicBox();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
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
          child: Image.asset(
            'assets/images/pic.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
