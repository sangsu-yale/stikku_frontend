import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/constants/result_enum.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/functions.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class GridViewZone extends StatelessWidget {
  const GridViewZone({
    super.key,
    required this.filterList,
    required this.isarController,
    required this.listTopSearchController,
  });

  final List<GameResult> filterList;
  final ListTopSearchController listTopSearchController;
  final IsarService isarController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3 / 3,
      ),
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        final ticket = filterList[index];
        return GestureDetector(
          onTap: () async {
            await goToDetails(isarController, ticket.date!.toLocal());
          },
          child: ClipOval(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(100), // 큰 값으로 설정하여 원형에 가까운 모양으로
              ),
              color: (ticket.result as GameResultType).color,
              child: GridTile(
                footer: IconButton(
                  alignment: Alignment.bottomCenter,
                  icon: Icon(
                      ticket.isFavorite
                          ? Custom.heartstraight_1
                          : Custom.heartstraight,
                      color: Colors.red,
                      size: 17),
                  onPressed: () {
                    listTopSearchController.toggleFavorite(ticket.id);
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('yyyy.MM.dd').format(ticket.date!),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text((ticket.result as GameResultType).name,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
