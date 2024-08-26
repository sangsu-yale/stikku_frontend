part of '../../../pages/login_page.dart';

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text(
        "로그인",
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
