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

// 경기장 좌석
Widget _buildStadiumAndSeatInput(String stadiumORseat, RxBool viewingMode,
    TextEditingController controller) {
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
      maxLength: 30,
      minLines: 1,
      maxLines: 2,
      controller: controller,
      readOnly: viewingMode.value ? false : true,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black26),
        hintText: viewingMode.value ? stadiumORseat : "집관",
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue), // 포커스 시 보더 색상
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // 활성화된 상태의 보더 색상
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent), // 에러 상태의 보더 색상
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // 비활성 상태의 보더 색상
        ),
      ),
    );
  });
}
