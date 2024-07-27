part of '../../pages/details_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    super.key,
    required this.formController,
    required this.gameResult,
  });

  final FormController formController;
  final GameResult gameResult;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
          onPressed: () => {
                Get.previousRoute != '/write' ||
                        Get.previousRoute != '/WritePage'
                    ? Get.offAllNamed('/')
                    : Get.back()
              },
          icon: const Icon(Custom.x, color: Colors.blue)),
      actions: [
        IconButton(
          onPressed: () async {
            Get.defaultDialog(
              title: "정말 삭제하시겠습니까?",
              middleText: "이 작업은 되돌릴 수 없습니다.",
              textConfirm: "확인",
              textCancel: "취소",
              confirmTextColor: Colors.white,
              onConfirm: () async {
                formController.deleteDetails(gameResult.date);
                Get.offAndToNamed('/list');
              },
            );
          },
          icon: const Icon(Custom.trash, color: Colors.blue),
        ),
        IconButton(
            onPressed: () async {
              await Get.to(
                () => WritePage(isEditMode: true),
                arguments: {
                  "result": gameResult.result,
                  "day": gameResult.date.toUtc(),
                  "gameTitle": gameResult.gameTitle,
                  "team1": gameResult.team1,
                  "team2": gameResult.team2,
                  "score1": gameResult.score1,
                  "score2": gameResult.score2,
                  "stadium": gameResult.stadium,
                  "seatLocation": gameResult.seatLocation,
                  "comment": gameResult.comment,
                  "reviewComment": gameResult.reviewComment,
                  "playerOfTheMatch": gameResult.playerOfTheMatch,
                  "food": gameResult.food,
                },
              );
            },
            icon: const Icon(Custom.pencilsimple__1_, color: Colors.blue)),
        IconButton(
            onPressed: () {
              // 추가
            },
            icon: const Icon(Custom.arrowlinedown, color: Colors.blue)),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
