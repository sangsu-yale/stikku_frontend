part of '../../../pages/home_page.dart';

class _FabButton extends StatelessWidget {
  const _FabButton({
    required this.calendarController,
    required this.isarController,
  });

  final CalendarController calendarController;
  final IsarService isarController;

  @override
  Widget build(BuildContext context) {
    final events =
        isarController.getEventsForDay(calendarController.today.value);

    double btnSize = MediaQuery.of(context).size.width / 7;

    return events.isNotEmpty
        ? IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.blue[50],
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            ),
            onPressed: () async {
              final todayTicket = await isarController
                  .getDetails(calendarController.today.value);
              Get.toNamed('/details', arguments: todayTicket);
            },
            icon: const Icon(Custom.noteblank, size: 30, color: Colors.blue))
        : Container(
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
              children: GameResultType.values.map((type) {
                return dialChild(
                  type,
                  type.label,
                  type.icon,
                  type.color,
                );
              }).toList(),
            ),
          );
  }

// child 버튼 설정
  SpeedDialChild dialChild(result, resultLabel, resultIcon, color) {
    return SpeedDialChild(
      backgroundColor: Colors.white,
      elevation: 0,
      onTap: () {
        Get.toNamed('/write',
            arguments: GameResult(
                result: result, date: calendarController.today.value));
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
