import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    required this.listTopSearchController,
  });

  final ListTopSearchController listTopSearchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              // 필터 기능
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      _showFilterDialog(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 3, 5, 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: 1, color: Colors.black38),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_drop_down, color: Colors.blue),
                          Text(
                            style: const TextStyle(fontSize: 13),
                            _getFilterOptionText(
                                listTopSearchController.filterOption.value),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              // 즐겨찾기 On Off
              IconButton(
                icon: Obx(() => Icon(
                      listTopSearchController.showFavoritesOnly.value
                          ? Custom.heartstraight_1
                          : Custom.heartstraight,
                      color: Colors.red,
                    )),
                onPressed: () {
                  listTopSearchController.toggleShowFavoritesOnly();
                },
              ),
            ],
          ),
          // 정렬 메뉴 버튼
          Row(
            children: [
              IconButton(
                icon: Obx(() => Icon(
                      listTopSearchController.viewOption.value ==
                              ViewOption.list
                          ? Custom.hashstraight
                          : Custom.listheart__2_,
                    )),
                onPressed: () {
                  listTopSearchController.setViewOption(
                    listTopSearchController.viewOption.value == ViewOption.list
                        ? ViewOption.grid
                        : ViewOption.list,
                  );
                },
              ),
              Obx(
                () => PopupMenuButton<SortOption>(
                  onSelected: (SortOption result) {
                    listTopSearchController.setSortOption(result);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SortOption>>[
                    const PopupMenuItem<SortOption>(
                      value: SortOption.writtenOrder,
                      child: Text('작성순'),
                    ),
                    const PopupMenuItem<SortOption>(
                      value: SortOption.newestFirst,
                      child: Text('최신순'),
                    ),
                    const PopupMenuItem<SortOption>(
                      value: SortOption.oldestFirst,
                      child: Text('오래된순'),
                    ),
                  ],
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_drop_down, color: Colors.blue),
                      Text(_getSortOptionText(
                          listTopSearchController.sortOption.value)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // 화면 설정 버튼
        ],
      ),
    );
  }
}

String _getSortOptionText(SortOption option) {
  switch (option) {
    case SortOption.writtenOrder:
      return '작성순';
    case SortOption.newestFirst:
      return '최신순';
    case SortOption.oldestFirst:
      return '오래된순';
  }
}

void _showFilterDialog(BuildContext context) {
  final ListTopSearchController listTopSearchController = Get.find();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('필터 선택'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: FilterOption.values.map((option) {
            return Obx(() => RadioListTile<FilterOption>(
                  title: Text(_getFilterOptionText(option)),
                  value: option,
                  groupValue: listTopSearchController.filterOption.value,
                  onChanged: (FilterOption? value) {
                    if (value != null) {
                      listTopSearchController.setFilterOption(value);
                      Navigator.of(context).pop();
                    }
                  },
                ));
          }).toList(),
        ),
      );
    },
  );
}

String _getFilterOptionText(FilterOption option) {
  switch (option) {
    case FilterOption.all:
      return '전체보기';
    case FilterOption.teamSupport:
      return '응원팀만';
    case FilterOption.live:
      return '직관만';
    case FilterOption.home:
      return '집관만';
    case FilterOption.won:
      return '이긴경기만';
    case FilterOption.lost:
      return '진경기만';
  }
}
