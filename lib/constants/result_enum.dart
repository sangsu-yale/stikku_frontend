// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum GameResultType {
  WIN,
  LOSE,
  TIE,
  CANCEL,
}

// Extension을 사용하여 각 속성을 정의
extension GameResultTypeProperties on GameResultType {
  String get name {
    return toString().split('.').last;
  }

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

  ImageProvider get icon {
    switch (this) {
      case GameResultType.CANCEL:
        return const AssetImage('assets/images/icons/cancel.png');
      case GameResultType.TIE:
        return const AssetImage('assets/images/icons/tie.png');
      case GameResultType.LOSE:
        return const AssetImage('assets/images/icons/lose.png');
      case GameResultType.WIN:
        return const AssetImage('assets/images/icons/win.png');
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
