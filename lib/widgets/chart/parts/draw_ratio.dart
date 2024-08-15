part of '../../../pages/charts_page.dart';

class _DrawRatio extends StatelessWidget {
  const _DrawRatio({
    required this.stats,
  });

  final Map<String, dynamic> stats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const Text(
            "직관 통계",
            style: TextStyle(fontSize: 20),
          ),
          stats["liveGame"] == 0
              ? AspectRatio(
                  aspectRatio: 1.3,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          const Text(
                            "아직 직관 관람이 없습니다",
                            style: TextStyle(color: Colors.black45),
                          ),
                          PieChart(
                            PieChartData(
                              borderData: FlBorderData(
                                show: true,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 20,
                              sections: notShowingSections(),
                            ),
                          ),
                        ]),
                  ),
                )
              : AspectRatio(
                  aspectRatio: 1.3,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(
                          show: true,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 20,
                        sections: showingSections(stats),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
