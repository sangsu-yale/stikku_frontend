import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListTopSearchController extends GetxController {
  var searchText = ''.obs;
  var filteredList = <Map<String, dynamic>>[].obs;
  var isAscending = true.obs; // 정렬 상태를 나타내는 변수

  var itemList = <Map<String, dynamic>>[
    {
      'homeTeam': '삼성 라이온즈',
      'homeScore': "3",
      'awayTeam': '한화 이글스',
      'awayScore': "3",
      'result': 'WIN',
      'date': '2024.05.30',
      'stadium': '한화 이글스파크',
      'seat': '버건디 112구역 12번',
    },
    {
      'homeTeam': 'LG 트윈스',
      'homeScore': "4",
      'awayTeam': '기아 타이거즈',
      'awayScore': "2",
      'result': 'LOSE',
      'date': '2024.06.01',
      'stadium': '잠실 야구장',
      'seat': '블루 203구역 10번',
    },
    // ... 다른 아이템들 추가
  ].obs;

  @override
  void onInit() {
    super.onInit();
    filteredList.value = itemList;
    searchText.listen((value) {
      filterList(value);
    });
  }

  void updateSearchText(String text) {
    searchText.value = text;
  }

  void filterList(String query) {
    if (query.isEmpty) {
      filteredList.value = itemList;
    } else {
      filteredList.value = itemList
          .where((item) =>
              item['homeTeam'].contains(query) ||
              item['awayTeam'].contains(query) ||
              item['date'].contains(query) ||
              item['stadium'].contains(query) ||
              item['seat'].contains(query))
          .toList();
    }
  }

  void sortByDate() {
    isAscending.value = !isAscending.value;
    DateFormat dateFormat = DateFormat('yyyy.MM.dd');
    filteredList.sort((a, b) {
      DateTime dateA = dateFormat.parse(a['date']);
      DateTime dateB = dateFormat.parse(b['date']);
      return isAscending.value
          ? dateA.compareTo(dateB)
          : dateB.compareTo(dateA);
    });
  }
}
