part of '../../../pages/details_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required this.formController,
    required this.gameResult,
    required this.onScreenshot,
  });

  final FormController formController;
  final GameResult gameResult;
  final VoidCallback onScreenshot;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        onPressed: () => {
          Get.previousRoute != '/write' || Get.previousRoute != '/WritePage'
              ? Get.offAllNamed('/')
              : Get.back()
        },
        icon: const Icon(Custom.x, color: Colors.blue),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            Get.defaultDialog(
              title: "정말 삭제하시겠습니까?",
              middleText: "이 작업은 되돌릴 수 없습니다.",
              textConfirm: "확인",
              textCancel: "취소",
              confirmTextColor: Colors.white,
              onConfirm: () async {
                formController.deleteDetails(gameResult.date!);
              },
            );
          },
          icon: const Icon(Custom.trash, color: Colors.blue),
        ),
        IconButton(
          onPressed: () async {
            formController.currentFormIndex(0);
            await Get.to(
              () => WritePage(isEditMode: true),
              arguments: gameResult,
            );
          },
          icon: const Icon(Custom.pencilsimple__1_, color: Colors.blue),
        ),
        IconButton(
          onPressed: onScreenshot,
          icon: const Icon(Custom.arrowlinedown, color: Colors.blue),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
