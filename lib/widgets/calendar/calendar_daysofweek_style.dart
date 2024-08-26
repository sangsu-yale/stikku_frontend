import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

DaysOfWeekStyle calendarDaysofweekStyle(BuildContext context, double textSize) {
  return DaysOfWeekStyle(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Theme.of(context).primaryColor, // 원하는 색상
          width: 1.0, // 원하는 두께
        ),
      ),
    ),
    weekdayStyle: TextStyle(
      color: Colors.grey[400],
      fontSize: textSize,
    ),
    weekendStyle: TextStyle(
      color: Colors.grey[400],
      fontSize: textSize,
    ),
  );
}
