part of '../../../pages/list_page.dart';

class ListSearchBar extends StatelessWidget {
  const ListSearchBar({
    super.key,
    required TextEditingController controller,
    required this.listTopSearchController,
  }) : _controller = controller;

  final TextEditingController _controller;
  final ListTopSearchController listTopSearchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: '검색',
                hintStyle: TextStyle(color: Colors.black26),
                border: InputBorder.none,
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
            icon: const Icon(Custom.x, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
