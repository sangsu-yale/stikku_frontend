part of '../../../pages/user_n_data_page.dart';

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text(
        "유저 및 데이터",
        style: TextStyle(color: Colors.blue),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Custom.caretleft, color: Colors.blue),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
