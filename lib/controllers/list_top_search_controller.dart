import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/config/isar_db.dart';

class ListTopSearchController extends GetxController {
  var searchText = ''.obs;
  var filteredList = <GameResult>[].obs;
  var isAscending = true.obs;
  var isLoading = false.obs;
  var showFavoritesOnly = false.obs; // 즐겨찾기 필터 추가
  var favoriteIds = <int>[].obs; // 즐겨찾기 ID 목록

  final Isar _isar;
  late SharedPreferences _prefs;

  ListTopSearchController() : _isar = Get.find<IsarDB>().isar;

  @override
  void onInit() {
    super.onInit();
    initPrefs().then((_) {
      loadGameResults();
      searchText.listen((value) {
        filterList(value);
      });
    });
  }

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    favoriteIds.value =
        _prefs.getStringList('favorites')?.map(int.parse).toList() ?? [];
  }

  Future<void> loadGameResults() async {
    isLoading.value = true;
    final results = await _isar.gameResults.where().findAll();
    results.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    filteredList.assignAll(results);
    isLoading.value = false;
    applyFavoriteFilter();
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
    applyFavoriteFilter();
  }

  void sortByDate() {
    isAscending.value = !isAscending.value;
    filteredList.sort((a, b) {
      return isAscending.value
          ? a.date.compareTo(b.date)
          : b.date.compareTo(a.date);
    });
  }

  void toggleFavorite(int id) {
    if (favoriteIds.contains(id)) {
      favoriteIds.remove(id);
    } else {
      favoriteIds.add(id);
    }
    _prefs.setStringList(
        'favorites', favoriteIds.map((e) => e.toString()).toList());
    applyFavoriteFilter();
  }

  void toggleFavoriteFilter() {
    showFavoritesOnly.value = !showFavoritesOnly.value;
    applyFavoriteFilter();
  }

  void applyFavoriteFilter() {
    if (showFavoritesOnly.value) {
      filteredList.value =
          filteredList.where((item) => favoriteIds.contains(item.id)).toList();
    } else {
      // 여기가 없는 거 같거든? 채워줄래? ㅠㅠ
      // 나는 전체 목록이 보여지기를 원해
    }
  }
}
