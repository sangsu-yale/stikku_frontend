import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';

class ListPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController =
      Get.put(ListTopSearchController());
  final isarController = Get.find<IsarService>();
  final TextEditingController _controller = TextEditingController();

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // 검색 ZONE
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: '검색',
                  ),
                  onChanged: (value) {
                    listTopSearchController.searchQuery.value = value;
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  _controller.clear();
                  listTopSearchController.searchQuery.value = '';
                },
                icon: const Icon(
                  Icons.cancel,
                ),
              ),
            ],
          ),

          // 필터 ZONE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  // 필터 기능
                  Obx(
                    () {
                      return TextButton(
                        child: Text(_getFilterOptionText(
                            listTopSearchController.filterOption.value)),
                        onPressed: () {
                          _showFilterDialog(context);
                        },
                      );
                    },
                  ),

                  // 즐겨찾기 On Off
                  IconButton(
                    icon: Obx(() => Icon(
                          listTopSearchController.showFavoritesOnly.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                        )),
                    onPressed: () {
                      listTopSearchController.toggleShowFavoritesOnly();
                    },
                  ),
                ],
              ),
              // 정렬 메뉴 버튼
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
                      Text(_getSortOptionText(
                          listTopSearchController.sortOption.value)),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              // 화면 설정 버튼
              IconButton(
                icon: Obx(() => Icon(
                      listTopSearchController.viewOption.value ==
                              ViewOption.list
                          ? Icons.grid_view
                          : Icons.list,
                    )),
                onPressed: () {
                  listTopSearchController.setViewOption(
                    listTopSearchController.viewOption.value == ViewOption.list
                        ? ViewOption.grid
                        : ViewOption.list,
                  );
                },
              ),
            ],
          ),

          // 카드 리스트 ZONE
          Expanded(
            child: Obx(
              () {
                if (listTopSearchController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (listTopSearchController.ticketlist.isEmpty) {
                  return const Center(
                    child: Text('경기 티켓을 발급해 보세요'),
                  );
                }

                // 리스트 시작
                final filterList = listTopSearchController.getSortedTickets();
                return listTopSearchController.viewOption.value ==
                        ViewOption.list
                    ? ListView.builder(
                        itemCount: filterList.length,
                        itemBuilder: (context, index) {
                          final item = filterList[index];

                          // 아이템 빌드 로직
                          return GestureDetector(
                            onTap: () async {
                              final gameResult = await isarController
                                  .getDetails(item.date.toLocal());
                              Get.toNamed('/details', arguments: gameResult);
                            },
                            child: Container(
                              color: Colors.white,
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  // 경기 결과
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // 팀
                                      Column(
                                        children: [
                                          // 우리팀
                                          Row(
                                            children: [
                                              Text(item.team1),
                                              Text(item.score1),
                                            ],
                                          ),
                                          // 상대팀
                                          Row(
                                            children: [
                                              Text(item.team2),
                                              Text(item.score2),
                                            ],
                                          ),
                                        ],
                                      ),
                                      // 승패 유무
                                      Row(
                                        children: [
                                          Text(item.result),
                                          // 좋아요 유무
                                          IconButton(
                                            icon: Icon(
                                              item.isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: item.isFavorite
                                                  ? Colors.red
                                                  : null,
                                            ),
                                            onPressed: () {
                                              listTopSearchController
                                                  .toggleFavorite(item.id);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // 경기 내용
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(DateFormat('yyyy.MM.dd')
                                          .format(item.date)),
                                      Text(item.stadium),
                                      Text(item.seatLocation)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                        ),
                        itemCount: filterList.length,
                        itemBuilder: (context, index) {
                          final ticket = filterList[index];
                          return Card(
                            child: GridTile(
                              footer: IconButton(
                                icon: Icon(
                                  ticket.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: ticket.isFavorite ? Colors.red : null,
                                ),
                                onPressed: () {
                                  listTopSearchController
                                      .toggleFavorite(ticket.id);
                                },
                              ),
                              child: Text(ticket.result),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
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
      return '응원팀만 보기';
    case FilterOption.live:
      return '직관만 보기';
    case FilterOption.home:
      return '집관만 보기';
    case FilterOption.won:
      return '이긴경기만 보기';
    case FilterOption.lost:
      return '진경기만 보기';
  }
}
