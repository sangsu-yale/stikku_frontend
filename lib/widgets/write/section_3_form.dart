part of '../write/game_result_form.dart';

class _Section3Form extends StatelessWidget {
  const _Section3Form({
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
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "경기 제목",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 0, 0, 0)),
          ),
          const SizedBox(height: 10),
          // 경기장
          buildTitleAndCommentInput(
              "(옵션) OO리그 O차전", formController.gameTitleCon, 1, 2),
          const SizedBox(height: 25),
          const Text(
            "한줄 코멘트",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(170, 0, 0, 0)),
          ),
          // 좌석
          const SizedBox(height: 10),
          buildTitleAndCommentInput(
              "(옵션) 30자 이내의 코멘트", formController.commentCon, 1, 2),
        ],
      ),
    );
  }
}
