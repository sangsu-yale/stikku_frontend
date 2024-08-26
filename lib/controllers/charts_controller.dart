import 'package:get/get.dart';
import 'package:stikku_frontend/constants/result_enum.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class ChartsController extends GetxController {
  final isarController = Get.find<IsarService>();

  Future<Map<String, dynamic>> loadGameResults() async {
    // 불러오기
    final ticketList = await isarController.getChartData();

    // 필요한 것
    // 직관 횟수
    var liveGame = 0;
    // 집관 횟수
    var homeGame = 0;
    // 직관 승수
    var liveGameWinning = 0;
    // 집관 승수
    var homeGameWinning = 0;
    // 총 승수
    var totalWinning = 0;
    // 총 관람 횟수
    var allViewCount = ticketList.length;

    var lose = 0;
    var tie = 0;
    var cancel = 0;

    for (var i = 0; i < ticketList.length; i++) {
      // 만약에 직관이라면?
      if (ticketList[i].viewingMode) {
        liveGame++;
        var r = ticketList[i].result;

        if (r == GameResultType.WIN) {
          liveGameWinning++;
        } else if (r == GameResultType.LOSE) {
          lose++;
        } else if (r == GameResultType.TIE) {
          tie++;
        } else if (r == GameResultType.CANCEL) {
          cancel++;
        }
        // 만약에 집관이라면?
      } else {
        homeGame++;
        if (ticketList[i].result == GameResultType.WIN) {
          homeGameWinning++;
        }
      }
    }

    // 직관 승률
    double liveGameWinRate = liveGame > 0
        ? (liveGameWinning / liveGame) * 100
        : 0; //toStringAsFixed(2)

    // 집관 승률
    double homeGameWinRate = homeGame > 0
        ? (homeGameWinning / homeGame) * 100
        : 0; //toStringAsFixed(2)

    // 총 승수
    totalWinning = liveGameWinning + homeGameWinning;

    // 총 승률
    double totalWinRate =
        allViewCount > 0 ? (totalWinning / allViewCount) * 100 : 0;

    double liveGameLoseRate = liveGame > 0 ? (lose / liveGame) * 100 : 0;
    double liveGameTieRate = liveGame > 0 ? (tie / liveGame) * 100 : 0;
    double liveGameCancelRate = liveGame > 0 ? (cancel / liveGame) * 100 : 0;

    return {
      'liveGame': liveGame,
      'homeGame': homeGame,
      'liveGameWinning': liveGameWinning,
      'homeGameWinning': homeGameWinning,
      'totalWinning': totalWinning,
      'allViewCount': allViewCount,
      'liveGameWinRate': liveGameWinRate,
      'homeGameWinRate': homeGameWinRate.toStringAsFixed(1),
      'totalWinRate': totalWinRate.toStringAsFixed(1),
      'liveGamelose': liveGameLoseRate,
      'liveGameTie': liveGameTieRate,
      'liveGameCancel': liveGameCancelRate,
    };
  }
}
