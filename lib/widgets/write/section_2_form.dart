part of '../../pages/write_page.dart';

class _Section2Form extends StatelessWidget {
  const _Section2Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      // * ✅ 2번 폼 (경기장, 좌석)
      child: Column(
        children: [
          // 경기장
          _buildStadiumAndSeatInput(
              "경기장", formController.viewingMode, formController.seatLocation),

          // 좌석
          _buildStadiumAndSeatInput(
              "좌석", formController.viewingMode, formController.seatLocation),
        ],
      ),
    );
  }
}

// 경기장 좌석
Widget _buildStadiumAndSeatInput(
    String stadiumORseat, RxBool viewingMode, RxString seatLocation) {
  return Obx(() {
    return TextFormField(
      readOnly: viewingMode.value ? false : true,
      decoration: InputDecoration(
        hintText: viewingMode.value ? stadiumORseat : "집관",
        border: seatLocation.value == ""
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red))
            : null,
      ),
      onChanged: (value) {
        seatLocation.value = value;
      },
    );
  });
}
