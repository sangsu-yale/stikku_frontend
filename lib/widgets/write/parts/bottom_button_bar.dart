part of '../../../pages/write_page.dart';

class _BottomButtonBar extends StatelessWidget {
  const _BottomButtonBar({
    required this.formController,
    required this.formKey,
    required this.isEditMode,
  });

  final FormController formController;
  final GlobalKey<FormState> formKey;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 110,
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () {
              return Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                  color: Colors.black12,
                ))),
                child: BottomNavigationBar(
                  unselectedFontSize: 14,
                  selectedFontSize: 14,
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  elevation: 0,
                  currentIndex: formController.currentFormIndex.value,
                  onTap: (index) {
                    formController.changeForm(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      label: '게임 결과',
                    ),
                    BottomNavigationBarItem(
                        icon: SizedBox.shrink(), label: '관람 일기'),
                  ],
                ),
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //submit
                      formController.submit(isEditMode);
                    } else {
                      Get.snackbar('게임 결과 폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                    }
                  },
                  child: const Text("작성 완료"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
