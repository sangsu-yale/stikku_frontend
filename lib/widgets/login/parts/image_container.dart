part of '../../../pages/login_page.dart';

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    super.key,
    required List<String> imagePaths,
    required this.index,
  }) : _imagePaths = imagePaths;

  final List<String> _imagePaths;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.tight,
      child: Image.asset(_imagePaths[index]),
    );
  }
}
