import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stikku_frontend/config/custom_icons.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';

class GridViewZone extends StatelessWidget {
  GridViewZone({
    super.key,
    required this.filterList,
    required this.listTopSearchController,
  });

  final List<GameResult> filterList;
  final ListTopSearchController listTopSearchController;

  final List<String> resultColor = ['win', 'lose', 'tie', 'cancel'];
  final colorMap = {
    'win': Colors.blue,
    'lose': Colors.red,
    'tie': Colors.grey,
    'cancel': Colors.orange,
  };

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
      ),
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        final ticket = filterList[index];
        return Card(
          color: Colors.white,
          child: GridTile(
            footer: IconButton(
              alignment: Alignment.bottomRight,
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
                    DateFormat('yyyy.MM.dd').format(ticket.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(ticket.result.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorMap[ticket.result] ?? Colors.grey,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
