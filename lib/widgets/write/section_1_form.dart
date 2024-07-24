part of '../../pages/write_page.dart';

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
          children: [
            // ✅ 점수, 팀 이름, 응원팀
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1팀
                _buildTeamInput(1, formController.score1, formController.team1,
                    formController.team1IsMyTeam),
                const Flexible(
                    flex: 1,
                    child: Text(
                      "vs",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )),
                // 2팀
                _buildTeamInput(2, formController.score2, formController.team2,
                    formController.team2IsMyTeam),
              ],
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

// 점수, 팀 이름, 응원팀 폼
  Widget _buildTeamInput(int teamNumber, RxString scoreValue,
      RxString teamValue, RxBool isMyTeamValue) {
    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: Column(
        children: [
          // 팀 점수
          Obx(() {
            return TextFormField(
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              initialValue: scoreValue.value == '0' ? null : scoreValue.value,
              onChanged: (value) {
                scoreValue.value = value;
              },
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
          }),

          // 팀 이름
          TextFormField(
            initialValue: teamValue.value.isEmpty ? '' : teamValue.value,
            onChanged: (value) {
              teamValue.value = value;
            },
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: '팀 이름',
              hintStyle: TextStyle(color: Colors.black26),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
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
          ),

          // 팀 응원
          Obx(
            () {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("응원팀"),
                  Checkbox(
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: isMyTeamValue.value,
                      onChanged: (bool? value) {
                        isMyTeamValue.value = !(isMyTeamValue.value);
                      })
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
