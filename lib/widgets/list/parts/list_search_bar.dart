part of '../../../pages/list_page.dart';

class ListSearchBar extends StatelessWidget {
  const ListSearchBar({
    super.key,
    required TextEditingController controller,
    required this.listTopSearchController,
    required this.focusNode, // FocusNode 추가
  }) : _controller = controller;

  final TextEditingController _controller;
  final ListTopSearchController listTopSearchController;
  final FocusNode focusNode; // FocusNode 추가

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
              focusNode: focusNode, // FocusNode 할당
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
              focusNode.unfocus(); // 검색어를 지울 때도 포커스를 해제
            },
            icon: const Icon(Custom.x, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
