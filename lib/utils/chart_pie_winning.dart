import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> notShowingSections() {
  return List.generate(1, (i) {
    const fontSize = 16.0;
    const radius = 100.0;

    return PieChartSectionData(
      color: Colors.black12,
      value: 100,
      title: '',
      radius: radius,
      titleStyle: const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  });
}

List<PieChartSectionData> showingSections(stats) {
  return List.generate(4, (i) {
    // final isTouched = i == touchedIndex;
    const fontSize = 16.0;
    const radius = 100.0;

    switch (i) {
      case 0:
        return PieChartSectionData(
          color: Colors.blue[500],
          value: stats["liveGameWinRate"],
          title: '승 ${stats["liveGameWinRate"].toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 1:
        return PieChartSectionData(
          color: Colors.red[500],
          value: stats["liveGamelose"],
          title: '패 ${stats["liveGamelose"]?.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 2:
        return PieChartSectionData(
          color: Colors.green[500],
          value: stats["liveGameTie"],
          title: '무 ${stats["liveGameTie"]?.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      case 3:
        return PieChartSectionData(
          color: Colors.grey[500],
          value: stats["liveGameCancel"],
          title: '취 ${stats["liveGameCancel"]?.toStringAsFixed(0)}%',
          radius: radius,
          titleStyle: const TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        );
      default:
        throw Exception('Oh no');
    }
  });
}
