import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle calendarBodyStyle() {
  return const CalendarStyle(
    outsideDaysVisible: false,
    markerSizeScale: 1,
    markersAnchor: 1,
    markerDecoration:
        BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
  );
}



// 꾸미기 백업
   // defaultBuilder: (context, date, _) {
          //   return SizedBox(
          //     height: cellSize,
          //     width: cellSize,
          //     child: Center(
          //       child: Text(
          //         DateFormat('dd').format(date),
          //         style: TextStyle(
          //           color: Colors.grey[400],
          //           fontSize: textSize,
          //         ),
          //       ),
          //     ),
          //   );
          // },
 // todayBuilder: (context, date, _) {
          //   return Container(
          //     height: cellSize, // 원하는 높이로 설정
          //     width: cellSize, // 원하는 너비로 설정
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).primaryColorDark,
          //       shape: BoxShape.rectangle,
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     child: Center(
          //       child: Text(
          //         DateFormat('dd').format(date),
          //         style: TextStyle(
          //             color: Colors.white,
          //             fontWeight: FontWeight.w900,
          //             fontSize: textSize),
          //       ),
          //     ),
          //   );
          // },