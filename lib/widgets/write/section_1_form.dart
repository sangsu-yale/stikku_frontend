part of '../../pages/write_page.dart';

class _Section1Form extends StatelessWidget {
  const _Section1Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
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

          // ✅ 승취무패
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildResultOption(),
          ),

          // ✅ 점수, 팀 이름, 응원팀
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1팀
              _buildTeamInput(1, formController.score1, formController.team1,
                  formController.team1IsMyTeam),
              const Flexible(flex: 1, child: Text("vs")),
              // 2팀
              _buildTeamInput(2, formController.score2, formController.team2,
                  formController.team2IsMyTeam),
            ],
          ),
          const Text("응원팀은 없어도, 둘 다 해도 상관없어요!"),
        ],
      ),
    );
  }

// 승패무취
  List<Widget> _buildResultOption() {
    return List.generate(4, (index) {
      // 승취무패 옵션
      final List<String> options = ["win", "lose", "tie", "cancel"];
      final List<IconData> icons = [
        Icons.check,
        Icons.close,
        Icons.remove,
        Icons.cancel,
      ];
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(icons[index], size: 40),
              Text(options[index], style: const TextStyle(fontSize: 18)),
              Obx(() {
                return Radio<String>(
                  value: options[index],
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

// 점수, 팀 이름, 응원팀 폼
Widget _buildTeamInput(int teamNumber, RxString scoreValue, RxString teamValue,
    RxBool isMyTeamValue) {
  return Flexible(
    flex: 3,
    fit: FlexFit.tight,
    child: Column(
      children: [
        // 팀 점수
        Obx(() {
          return TextFormField(
            initialValue: scoreValue.value == '0' ? null : scoreValue.value,
            onChanged: (value) {
              scoreValue.value = value;
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: '0',
              border: scoreValue.value.isEmpty
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))
                  : null,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly // 숫자만 입력 가능하도록 설정
            ],
          );
        }),

        // 팀 이름
        TextFormField(
          initialValue: teamValue.value.isEmpty ? '' : teamValue.value,
          onChanged: (value) {
            teamValue.value = value;
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '팀 이름',
            border: teamValue.value.isEmpty
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))
                : null,
          ),
        ),

        // 팀 응원
        Obx(
          () {
            return CheckboxListTile(
              checkColor: Colors.black,
              title: const Text("응원팀"),
              value: isMyTeamValue.value,
              onChanged: (bool? value) {
                isMyTeamValue.value = !(isMyTeamValue.value);
              },
            );
          },
        ),
      ],
    ),
  );
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
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selectedValue == formController.viewingMode.value
                ? Colors.blue
                : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Column(
          children: [
            Icon(icon),
            Text(label),
          ],
        ),
      ),
    );
  });
}
