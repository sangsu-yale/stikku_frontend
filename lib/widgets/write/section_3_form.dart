part of '../../pages/write_page.dart';

class _Section3Form extends StatelessWidget {
  const _Section3Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      // 3번 폼 (경기 제목, 한줄 코멘트)
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // 경기 제목
        children: [
          const Text(
            "경기 제목",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 0, 0, 0)),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '예) OO리그 2차전',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue), // 포커스 시 보더 색상
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // 활성화된 상태의 보더 색상
              ),
            ),
            onChanged: (value) {
              formController.gameTitle.value = value;
            },
          ),
          const SizedBox(height: 25),
          const Text(
            "한줄 코멘트",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 0, 0, 0)),
          ),
          const SizedBox(height: 10),
          // 한줄 코멘트
          TextFormField(
            decoration: const InputDecoration(
              hintText: '경기에 대한 한줄 코멘트',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue), // 포커스 시 보더 색상
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // 활성화된 상태의 보더 색상
              ),
            ),
            onChanged: (value) {
              formController.comment.value = value;
            },
          ),
        ],
      ),
    );
  }
}
