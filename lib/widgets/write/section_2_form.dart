part of '../write/game_result_form.dart';

class _Section2Form extends StatelessWidget {
  const _Section2Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          left: BorderSide(width: 1.0, color: Colors.blue),
          right: BorderSide(width: 1.0, color: Colors.blue),
          // 아래쪽 경계선을 설정하지 않음
        ),
      ),
      // * ✅ 2번 폼 (경기장, 좌석)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "경기장",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 0, 0, 0)),
          ),
          const SizedBox(height: 10),
          // 경기장
          _buildStadiumAndSeatInput("예) 잠실 주경기장", formController.viewingMode,
              formController.stadiumCon),
          const SizedBox(height: 25),
          const Text(
            "좌석",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 0, 0, 0)),
          ),
          // 좌석
          const SizedBox(height: 10),
          _buildStadiumAndSeatInput("예) 200구역 12열 11번",
              formController.viewingMode, formController.seatLocationCon),
        ],
      ),
    );
  }
}

Widget _buildStadiumAndSeatInput(String stadiumORseat, RxBool viewingMode,
    TextEditingController controller) {
  const int maxBytes = 90; // byte로 최대 길이 설정

  return Obx(() {
    return TextFormField(
      validator: (value) {
        if (viewingMode.value) {
          if (value == null || value.trim().isEmpty) {
            return '필수';
          }
          return null;
        }
        return null;
      },
      minLines: 1,
      maxLines: 2,
      controller: controller,
      readOnly: viewingMode.value ? false : true,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black26),
        hintText: viewingMode.value ? stadiumORseat : "집관",
        border: viewingMode.value
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              )
            : const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
        focusedBorder: viewingMode.value
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              )
            : const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      onChanged: (newText) {
        // 입력된 텍스트의 byte 길이 계산 (UTF-8 기준)
        int byteLength = utf8.encode(newText).length;

        // 최대 byte 길이를 초과하면 이전 텍스트로 롤백
        if (byteLength > maxBytes) {
          // 최대 byte 길이에 맞추기 위해 텍스트 자르기
          while (utf8.encode(newText).length > maxBytes) {
            newText = newText.substring(0, newText.length - 1);
          }
          // 자른 텍스트를 컨트롤러에 반영
          controller.text = newText;
          // 커서를 텍스트 끝으로 이동
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: newText.length),
          );
        }
      },
    );
  });
}
