part of '../../pages/home_page.dart';

class _SaveCalendarImageButton extends StatelessWidget {
  const _SaveCalendarImageButton({
    required this.calendarController,
  });

  final CalendarController calendarController;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.download),
        ),
      ),
    );
  }
}
