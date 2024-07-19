part of '../../pages/write_page.dart';

class _Section3Form extends StatelessWidget {
  const _Section3Form({
    required this.formController,
  });

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      // 3번 폼 (경기 제목, 한줄 코멘트)
      child: Column(
        // 경기 제목
        children: [
          TextField(
            decoration: const InputDecoration(labelText: '경기 제목'),
            onChanged: (value) {
              formController.gameTitle.value = value;
            },
          ),

          // 한줄 코멘트
          TextField(
            decoration: const InputDecoration(labelText: '한줄 코멘트'),
            onChanged: (value) {
              formController.comment.value = value;
            },
          ),
        ],
      ),
    );
  }
}
