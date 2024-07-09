import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

HeaderStyle calendarHeaderStyle(BuildContext context) {
  return HeaderStyle(
    headerPadding: const EdgeInsets.only(bottom: 20),
    titleCentered: true,
    formatButtonVisible: false,
    titleTextFormatter: (date, locale) {
      return DateFormat('yyyy.M', locale).format(date);
    },
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 20,
      color: Colors.grey[700],
    ),

    // 월 이동 아이콘
    leftChevronPadding: const EdgeInsets.all(0),
    rightChevronPadding: const EdgeInsets.all(0),
    leftChevronIcon: Icon(
      Icons.arrow_circle_left,
      color: Theme.of(context).primaryColor,
      size: 30,
    ),
    rightChevronIcon: Icon(
      Icons.arrow_circle_right,
      color: Theme.of(context).primaryColor,
      size: 30,
    ),
  );
}
