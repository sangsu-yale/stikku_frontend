import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';
import 'package:stikku_frontend/widgets/list/list_grid_view.dart';
import 'package:stikku_frontend/widgets/list/list_list_view.dart';

part '../widgets/list/parts/cards_list.dart';
part '../widgets/list/parts/list_filter_bar.dart';
part '../widgets/list/parts/list_search_bar.dart';

class ListPage extends StatelessWidget {
  final ListTopSearchController listTopSearchController =
      Get.put(ListTopSearchController());
  final isarController = Get.find<IsarService>();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode(); // FocusNode 추가

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // 화면의 투명한 영역도 터치 감지
        onTap: () {
          _searchFocusNode.unfocus(); // ListSearchBar 외의 영역을 클릭하면 포커스 해제
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // 검색 ZONE
              ListSearchBar(
                controller: _controller,
                listTopSearchController: listTopSearchController,
                focusNode: _searchFocusNode, // FocusNode 전달
              ),
              // 필터 ZONE
              FilterBar(listTopSearchController: listTopSearchController),

              // 카드 리스트 ZONE
              CardsList(
                listTopSearchController: listTopSearchController,
                isarController: isarController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
