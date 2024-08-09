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
              return BottomNavigationBar(
                elevation: 1,
                currentIndex: formController.currentFormIndex.value,
                onTap: (index) {
                  formController.changeForm(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: SizedBox.shrink(), label: '게임 결과'),
                  BottomNavigationBarItem(
                      icon: SizedBox.shrink(), label: '관람 일기'),
                ],
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (formController.result.value == '') {
                      Get.snackbar(
                          '게임의 결과를 체크해 주세요', '상단의 승, 패, 유, 무 중 하나를 클릭하세요');
                    } else {
                      if (formKey.currentState!.validate()) {
                        //submit
                        formController.submit(isEditMode);
                      } else {
                        Get.snackbar(
                            '게임 결과 폼을 다 작성해 주세요', '빼먹은 부분이 없는지 확인해 주세요');
                      }
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
