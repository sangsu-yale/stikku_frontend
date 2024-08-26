part of '../write/game_result_form.dart';

class _Section1Form extends StatelessWidget {
  const _Section1Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            left: BorderSide(width: 1.0, color: Colors.blue),
            right: BorderSide(width: 1.0, color: Colors.blue),
            // 아래쪽 경계선을 설정하지 않음
          ),
        ),
        // * 1번 폼 (✅ 직관 유무, 점수 2, 팀 이름 2, 응원팀 2)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 응원팀
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _isMyTeam(formController.team1IsMyTeam),
                _isMyTeam(formController.team2IsMyTeam),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: _score(formController.score1Con)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(child: _score(formController.score2Con)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: _teamName(formController.team1Con)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(child: _teamName(formController.team2Con)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Custom.sealwarning_1, size: 13, color: Colors.black38),
                Text(
                  "  응원팀은 없어도, 둘 다 해도 상관없어요!",
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _teamName(TextEditingController teamValue) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '필수';
        }
        return null;
      },
      maxLength: 20,
      minLines: 1,
      maxLines: 3,
      controller: teamValue,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: '팀 이름',
        hintStyle: TextStyle(color: Colors.black26),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue), // 포커스 시 보더 색상
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // 활성화된 상태의 보더 색상
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent), // 에러 상태의 보더 색상
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // 비활성 상태의 보더 색상
        ),
      ),
    );
  }

  TextFormField _score(TextEditingController scoreValue) {
    return TextFormField(
      maxLength: 3,
      buildCounter: (context,
          {required currentLength, required isFocused, maxLength}) {
        return null;
      },
      controller: scoreValue,
      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: '0',
        hintStyle: TextStyle(color: Colors.black26),
        border: InputBorder.none,
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly // 숫자만 입력 가능하도록 설정
      ],
    );
  }

  Obx _isMyTeam(RxBool isMyTeamValue) {
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            isMyTeamValue.value = !isMyTeamValue.value;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isMyTeamValue.value ? Colors.blue : Colors.blue[50],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                      side: WidgetStateBorderSide.resolveWith(
                        (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return const BorderSide(color: Colors.transparent);
                          }
                          return const BorderSide(color: Colors.grey);
                        },
                      ),
                      checkColor: Colors.white,
                      activeColor: Colors.transparent,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: isMyTeamValue.value,
                      onChanged: (bool? value) {
                        isMyTeamValue.value = value!;
                      }),
                ),
                Text(
                  "응원팀",
                  style: TextStyle(
                      fontSize: 13,
                      color: isMyTeamValue.value ? Colors.white : Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
