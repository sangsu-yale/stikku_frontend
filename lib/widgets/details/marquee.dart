part of '../../widgets/details/front_view.dart';

class _Marquee extends StatelessWidget {
  const _Marquee({
    required this.gameResult,
  });

  final GameResult gameResult;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Marquee(
        delay: const Duration(milliseconds: 0000),
        disableAnimation: true,
        gap: 0,
        duration: const Duration(seconds: 20),
        pause: const Duration(milliseconds: 0000),
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 0, 102, 185)),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "${gameResult.result.toUpperCase()} " * 20,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.02, // 스크린 길이의 2%
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ));
  }
}
