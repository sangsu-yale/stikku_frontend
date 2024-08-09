part of '../../../pages/write_page.dart';

class _FormScreens extends StatelessWidget {
  const _FormScreens({
    required this.formController,
    required this.formKey,
    required this.isEditMode,
  });

  final FormController formController;
  final GlobalKey<FormState> formKey;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: formController.unfocus,
      child: Form(
        key: formKey,
        child: Obx(() {
          return IndexedStack(
            index: formController.currentFormIndex.value,
            children: [
              FocusScope(
                node: formController.focusScopeNode,
                child: GameResultForm(),
              ),
              FocusScope(
                  node: formController.focusScopeNode,
                  child: DiaryForm(isEditMode))
            ],
          );
        }),
      ),
    );
  }
}
