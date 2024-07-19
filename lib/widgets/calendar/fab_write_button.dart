part of '../../pages/home_page.dart';

class _FabWriteButton extends StatelessWidget {
  const _FabWriteButton({
    required this.calendarController,
  });

  final CalendarController calendarController;

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
        icon: Icons.edit,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        childPadding: const EdgeInsets.symmetric(vertical: 0),
        elevation: 0,
        spacing: 0,
        spaceBetweenChildren: 1,
        visible: true,
        curve: Curves.bounceIn,
        children: [
          dialChild("cancel", "취", Icons.cancel),
          dialChild("tie", "무", Icons.time_to_leave),
          dialChild("lose", "패", Icons.class_),
          dialChild("win", "승", Icons.star),
        ],
      ),
    );
  }

// child 버튼 설정
  SpeedDialChild dialChild(result, resultLabel, resultIcon) {
    return SpeedDialChild(
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
          ),
          Text(resultLabel)
        ],
      ),
    );
  }
}
