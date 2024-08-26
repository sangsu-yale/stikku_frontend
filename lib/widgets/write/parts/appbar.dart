part of '../../../pages/write_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required this.isEditMode,
    required this.formController,
  });

  final bool isEditMode;
  final FormController formController;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: isEditMode ? Colors.grey[200] : null,
        leading: IconButton(
          icon: Icon(
            Custom.caretleft,
            color: isEditMode ? Colors.blue : Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: Obx(
          () {
            return Text(
              DateFormat('yyyy.MM.dd').format(formController.date.value),
              style: TextStyle(color: isEditMode ? Colors.blue : Colors.white),
            );
          },
        ));
  }
}
