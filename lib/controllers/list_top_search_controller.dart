import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/services/isar_service.dart';

class ListTopSearchController extends GetxController {
  var searchText = ''.obs;
  var filteredList = <GameResult>[].obs;
  var isAscending = true.obs; // 정렬 상태를 나타내는 변수

  final Isar _isar; // Assuming you have Isar instance
  ListTopSearchController() : _isar = Get.find<IsarService>().isar;

  @override
  void onInit() {
    super.onInit();
    loadGameResults();
    searchText.listen((value) {
      filterList(value);
    });
  }

  void loadGameResults() async {
    final results = await _isar.gameResults.where().findAll();
    results.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    filteredList.assignAll(results);
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }

  void filterList(String query) {
    if (query.isEmpty) {
      loadGameResults();
    } else {
      filteredList.value = filteredList.where((item) {
        final queryLower = query.toLowerCase();
        return item.team1.toLowerCase().contains(queryLower) ||
            item.team2.toLowerCase().contains(queryLower) ||
            DateFormat('yyyy.MM.dd').format(item.date).contains(queryLower) ||
            item.stadium.toLowerCase().contains(queryLower) ||
            item.seatLocation.toLowerCase().contains(queryLower);
      }).toList();
    }
  }

  void sortByDate() {
    isAscending.value = !isAscending.value;
    filteredList.sort((a, b) {
      return isAscending.value
          ? a.date.compareTo(b.date)
          : b.date.compareTo(a.date);
    });
  }
}
