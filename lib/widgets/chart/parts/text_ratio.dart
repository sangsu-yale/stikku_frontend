part of '../../../pages/charts_page.dart';

class _TextRatio extends StatelessWidget {
  const _TextRatio({
    required this.stats,
  });

  final Map<String, dynamic> stats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  style: const TextStyle(color: Colors.black),
                  text:
                      "직관 승률 ${stats["liveGameWinRate"].toStringAsFixed(1)}% ",
                ),
                TextSpan(
                  text:
                      "(총 ${stats["liveGame"]}회 / ${stats["liveGameWinning"]}승)",
                )
              ],
              // style: const TextStyle(fontSize: 25),
            ),
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: "집관 승률 ${stats["homeGameWinRate"]}% ",
                ),
                TextSpan(
                  text:
                      "(총 ${stats["homeGame"]}회 / ${stats["homeGameWinning"]}승)",
                )
              ],
              // style: const TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider()
        ],
      ),
    );
  }
}
