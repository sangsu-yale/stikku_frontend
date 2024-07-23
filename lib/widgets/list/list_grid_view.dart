import 'package:flutter/material.dart';
import 'package:stikku_frontend/controllers/list_top_search_controller.dart';
import 'package:stikku_frontend/models/game_result_model.dart';

class GridViewZone extends StatelessWidget {
  const GridViewZone({
    super.key,
    required this.filterList,
    required this.listTopSearchController,
  });

  final List<GameResult> filterList;
  final ListTopSearchController listTopSearchController;

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
          child: GridTile(
            footer: IconButton(
              icon: Icon(
                ticket.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: ticket.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                listTopSearchController.toggleFavorite(ticket.id);
              },
            ),
            child: Text(ticket.result),
          ),
        );
      },
    );
  }
}
