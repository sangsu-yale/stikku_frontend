part of '../../../pages/charts_page.dart';

class _Header extends StatelessWidget {
  const _Header({
    required this.stats,
  });

  final Map<String, dynamic> stats;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      margin: const EdgeInsets.only(bottom: 30),
      alignment: Alignment.center,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Text(
        "총 승률 ${stats["totalWinRate"]}%",
        style: const TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
