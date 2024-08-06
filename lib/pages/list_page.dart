import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/widgets/list/list_filter_bar_widget.dart';
import 'package:stikku_frontend/widgets/list/list_grid_view.dart';
import 'package:stikku_frontend/widgets/list/list_list_view.dart';
import 'package:stikku_frontend/widgets/list/list_search_bar_widget.dart';

class ListPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController =
      Get.put(ListTopSearchController());
  final isarController = Get.find<IsarService>();
  final TextEditingController _controller = TextEditingController();

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 검색 ZONE
            ListSearchBar(
                controller: _controller,
                listTopSearchController: listTopSearchController),

            // 필터 ZONE
            FilterBar(listTopSearchController: listTopSearchController),

            // 카드 리스트 ZONE
            Expanded(
              child: Obx(
                () {
                  if (listTopSearchController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (listTopSearchController.ticketlist.isEmpty) {
                    return const Center(
                      child: Text(
                        '아직 관람한 경기가 없습니다',
                        style: TextStyle(color: Colors.black38),
                      ),
                    );
                  }

                  // 리스트 시작
                  final filterList = listTopSearchController.getSortedTickets();
                  return listTopSearchController.viewOption.value ==
                          ViewOption.list
                      ? ListViewZone(
                          filterList: filterList,
                          isarController: isarController,
                          listTopSearchController: listTopSearchController)
                      : GridViewZone(
                          filterList: filterList,
                          isarController: isarController,
                          listTopSearchController: listTopSearchController);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
