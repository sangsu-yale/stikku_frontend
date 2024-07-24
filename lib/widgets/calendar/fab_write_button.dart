part of '../../pages/home_page.dart';

class _FabWriteButton extends StatelessWidget {
  _FabWriteButton({
    required this.calendarController,
  });

  final CalendarController calendarController;
  final GameResult gameResult = GameResult();

  @override
  Widget build(BuildContext context) {
    double btnSize = MediaQuery.of(context).size.width / 7;

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(113, 55, 140, 231),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: SpeedDial(
        childrenButtonSize: Size(btnSize, btnSize),
        buttonSize: Size(btnSize, btnSize),
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        activeBackgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        direction: SpeedDialDirection.left,
        icon: Custom.pencilsimple__1_,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        childPadding: const EdgeInsets.symmetric(vertical: 0),
        elevation: 0,
        spacing: 0,
        spaceBetweenChildren: 1,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          dialChild("cancel", "취", Custom.umbrella__1_, Colors.grey),
          dialChild("tie", "무", Custom.clover__1_, Colors.green),
          dialChild("lose", "패", Custom.bookmarksimple__1_, Colors.red),
          dialChild("win", "승", Custom.star_1, Colors.blue),
        ],
      ),
    );
  }

// child 버튼 설정
  SpeedDialChild dialChild(result, resultLabel, resultIcon, color) {
    return SpeedDialChild(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onTap: () {
        Get.toNamed('/write', arguments: {
          "result": result,
          "day": calendarController.selectedDay.value
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            resultIcon,
            color: color,
            size: 30,
            shadows: [
              BoxShadow(
                color: color,
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          Text(
            resultLabel,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
