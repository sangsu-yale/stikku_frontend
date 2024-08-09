import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/constants/result_enum.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/config/isar_db.dart';

// 정렬순 옵션
enum SortOption { writtenOrder, newestFirst, oldestFirst }

// 필터 옵션
enum FilterOption { all, teamSupport, live, home, won, lost }

// 뷰 상태 옵션
enum ViewOption { list, grid }

class ListTopSearchController extends GetxController {
  final Isar _isar;

  ListTopSearchController() : _isar = Get.find<IsarDB>().isar;

  // 검색어 입력
  var searchQuery = ''.obs;

  // 필터, 정렬, 뷰 변경 옵션
  var sortOption = SortOption.writtenOrder.obs;
  var filterOption = FilterOption.all.obs;
  var viewOption = ViewOption.list.obs;

  var showFavoritesOnly = false.obs; // 즐겨찾기 필터 추가
  var favoriteIds = <int>[].obs; // 즐겨찾기 ID 목록

  var isLoading = false.obs;

  // 티켓리스트
  var ticketlist = <GameResult>[].obs;

  // 티켓리스트 초기화
  @override
  void onInit() {
    super.onInit();
    _loadPreferences();
    loadGameResults();
  }

  // fetch 티켓 리스트
  Future<void> loadGameResults() async {
    isLoading.value = true;

    // 불러오기
    final results = await _isar.gameResults.where().findAll();
    if (results.isNotEmpty) {
      results.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    }

    // ticketlist 반영
    ticketlist.assignAll(results);
    isLoading.value = false;
  }

  // 티켓 리스트 보임 방식
  List<GameResult> get displayedTickets {
    List<GameResult> filteredTickets = ticketlist;

    // 좋아요 유무
    if (showFavoritesOnly.value) {
      filteredTickets =
          filteredTickets.where((gameresult) => gameresult.isFavorite).toList();
    }

    // 검색
    if (searchQuery.value.isNotEmpty) {
      final queryLower = searchQuery.toLowerCase();
      filteredTickets = filteredTickets
          .where((ticket) =>
              ticket.team1!.toLowerCase().contains(queryLower) ||
              ticket.team2!.toLowerCase().contains(queryLower) ||
              DateFormat('yyyy.MM.dd')
                  .format(ticket.date!)
                  .contains(queryLower) ||
              ticket.score1!.toLowerCase().contains(queryLower) ||
              ticket.score2!.toLowerCase().contains(queryLower) ||
              ticket.seatLocation!.toLowerCase().contains(queryLower) ||
              ticket.stadium!.toLowerCase().contains(queryLower))
          .toList();
    }
    // 여기에 상태 변경 코드를 작성하세요

    return filteredTickets;
  }

// <!------------------ 뷰 변환 기능  -------------------->
  void setViewOption(ViewOption option) {
    viewOption.value = option;
  }

// <!------------------ 필터 기능  -------------------->
  void setFilterOption(FilterOption option) {
    filterOption.value = option;
    _savePreferences();
  }

// <!------------------ 최근순 오래된순 기능  -------------------->
  void setSortOption(SortOption option) {
    sortOption.value = option;
    _savePreferences();
  }

// <!------------------ 즐겨찾기 기능  -------------------->
  // 즐겨찾기만 보이게 할까요?
  void toggleShowFavoritesOnly() {
    showFavoritesOnly.value = !showFavoritesOnly.value;
    _savePreferences();
  }

  // 즐겨찾기 버튼 누르기
  void toggleFavorite(int id) async {
    await _isar.writeTxn(() async {
      final gameResult = await _isar.gameResults.get(id);
      if (gameResult != null) {
        gameResult.isFavorite = !gameResult.isFavorite;
        await _isar.gameResults.put(gameResult);
        // 티켓 리스트에서 해당 게임 결과 업데이트
        int index = ticketlist.indexWhere((ticket) => ticket.id == id);
        if (index != -1) {
          ticketlist[index] = gameResult;
          ticketlist.refresh(); // 리스트 갱신
        }
      }
    });
  }

//
  void _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('showFavoritesOnly', showFavoritesOnly.value);
    prefs.setInt('sortOption', sortOption.value.index);
    prefs.setInt('filterOption', filterOption.value.index);
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    showFavoritesOnly.value = prefs.getBool('showFavoritesOnly') ?? false;
    sortOption.value = SortOption.values[prefs.getInt('sortOption') ?? 0];
    filterOption.value = FilterOption.values[prefs.getInt('filterOption') ?? 0];
  }

  List<GameResult> getSortedTickets() {
    List<GameResult> sortedTickets = List.from(displayedTickets);

    switch (sortOption.value) {
      case SortOption.writtenOrder:
        break; // 기본 정렬
      case SortOption.newestFirst:
        sortedTickets.sort((a, b) => b.date!.compareTo(a.date!));
        break;
      case SortOption.oldestFirst:
        sortedTickets.sort((a, b) => a.date!.compareTo(b.date!));
        break;
    }

    switch (filterOption.value) {
      case FilterOption.all:
        break;
      case FilterOption.teamSupport:
        sortedTickets = sortedTickets
            .where((ticket) => ticket.team1IsMyTeam || ticket.team2IsMyTeam)
            .toList();
        break;
      case FilterOption.live:
        sortedTickets =
            sortedTickets.where((ticket) => ticket.stadium != '집관').toList();
        break;
      case FilterOption.home:
        sortedTickets =
            sortedTickets.where((ticket) => ticket.stadium == '집관').toList();
        break;
      case FilterOption.won:
        sortedTickets = sortedTickets
            .where((ticket) => ticket.result == GameResultType.WIN)
            .toList();
        break;
      case FilterOption.lost:
        sortedTickets = sortedTickets
            .where((ticket) => ticket.result == GameResultType.LOSE)
            .toList();
        break;
    }

    return sortedTickets;
  }
}
