part of '../../pages/write_page.dart';

class _Section0Form extends StatelessWidget {
  const _Section0Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            top: BorderSide(width: 1.0, color: Colors.blue),
            left: BorderSide(width: 1.0, color: Colors.blue),
            right: BorderSide(width: 1.0, color: Colors.blue),
            // 아래쪽 경계선을 설정하지 않음
          ),
        ),
        // * 1번 폼 (✅ 직관 유무, 점수 2, 팀 이름 2, 응원팀 2)
        child: Column(
          children: [
            // ✅ 직관 유무
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildObserverButton(false, Icons.home, "집관", formController),
                _buildObserverButton(
                    true, Icons.group_rounded, "직관", formController),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // ✅ 승취무패
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildResultOption(),
            ),
          ],
        ),
      ),
    );
  }

// ✅ 승패무취
  List<Widget> _buildResultOption() {
    return List.generate(4, (index) {
      // 승취무패 옵션

      IconData icon;
      Color color;
      String options;
      String viewOptions;

      switch (index) {
        case 0:
          icon = Custom.star_1;
          color = Colors.blue;
          options = 'win';
          viewOptions = '승';
          break;
        case 1:
          icon = Custom.bookmarksimple__1_;
          color = Colors.red;
          options = 'lose';
          viewOptions = '패';
          break;
        case 2:
          icon = Custom.clover__1_;
          color = Colors.green;
          options = 'tie';
          viewOptions = '무';
          break;
        case 3:
          icon = Custom.umbrella__1_;
          color = Colors.grey;
          options = 'cancel';
          viewOptions = '취';
          break;
        default:
          icon = Custom.alien; // 기본 아이콘 설정
          color = Colors.black; // 기본 색상 설정
          options = 'cancel';
          viewOptions = '취';
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: color.withOpacity(0.2),
                  ),
                  Text(
                    viewOptions,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Obx(() {
                return Radio<String>(
                  value: options,
                  groupValue: formController.result.value,
                  onChanged: (value) {
                    formController.result.value = value!;
                  },
                );
              }),
            ],
          ),
        ],
      );
    });
  }
}

// 직관, 집관 유무
Widget _buildObserverButton(bool selectedValue, IconData icon, String label,
    FormController formController) {
  return Obx(() {
    return GestureDetector(
      onTap: () {
        formController.setSelectedValue(selectedValue);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: selectedValue == formController.viewingMode.value
              ? const Color.fromARGB(255, 231, 244, 255)
              : Colors.transparent,
          border: Border.all(
            color: selectedValue == formController.viewingMode.value
                ? Colors.blue
                : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Icon(icon,
                color: selectedValue == formController.viewingMode.value
                    ? Colors.black
                    : Colors.black12),
            Text(
              label,
              style: TextStyle(
                  color: selectedValue == formController.viewingMode.value
                      ? Colors.black
                      : Colors.black12),
            ),
          ],
        ),
      ),
    );
  });
}
