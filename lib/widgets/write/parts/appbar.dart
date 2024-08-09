part of '../../../pages/write_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required this.isEditMode,
  });

  final bool isEditMode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Custom.caretleft,
          color: Colors.white,
        ),
        onPressed: () => Get.back(),
      ),
      title: Text(
        isEditMode ? "경기 기록 수정 페이지" : "경기 기록 작성 페이지",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
