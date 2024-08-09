// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stikku_frontend/config/custom_icons.dart';

enum GameResultType {
  WIN,
  CANCEL,
  LOSE,
  TIE,
}

// Extension을 사용하여 각 속성을 정의
extension GameResultTypeProperties on GameResultType {
  String get label {
    switch (this) {
      case GameResultType.CANCEL:
        return '취';
      case GameResultType.TIE:
        return '무';
      case GameResultType.LOSE:
        return '패';
      case GameResultType.WIN:
        return '승';
    }
  }

  IconData get icon {
    switch (this) {
      case GameResultType.CANCEL:
        return Custom.umbrella__1_;
      case GameResultType.TIE:
        return Custom.clover__1_;
      case GameResultType.LOSE:
        return Custom.bookmarksimple__1_;
      case GameResultType.WIN:
        return Custom.star_1;
    }
  }

  Color get color {
    switch (this) {
      case GameResultType.CANCEL:
        return Colors.grey;
      case GameResultType.TIE:
        return Colors.green;
      case GameResultType.LOSE:
        return Colors.red;
      case GameResultType.WIN:
        return Colors.blue;
    }
  }
}
