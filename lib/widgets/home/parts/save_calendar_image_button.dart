part of '../../../pages/home_page.dart';

class _SaveCalendarImageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Custom.arrowlinedown, color: Colors.transparent),
        ),
      ),
    );
  }
}
