part of '../../../pages/list_page.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    super.key,
    required this.listTopSearchController,
    required this.isarController,
  });

  final ListTopSearchController listTopSearchController;
  final IsarService isarController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          return listTopSearchController.viewOption.value == ViewOption.list
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
    );
  }
}
