// game_review_model.dart

import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/game_result_model.dart';

part 'game_review_model.g.dart';

@Collection()
class GameReview {
  Id id = Isar.autoIncrement; // ID 추가

  String? review;
  int? rating;
  String? playerOfTheMatch;
  String? mood;
  List<String>? homeTeamLineup;
  List<String>? awayTeamLineup;
  String? food;

  GameReview({
    this.review,
    this.rating,
    this.playerOfTheMatch,
    this.mood,
    this.homeTeamLineup,
    this.awayTeamLineup,
    this.food,
  });

  final gameResult = IsarLink<GameResult>();

  // 필드 정보를 반환하는 메서드
  List<Map<String, dynamic>> getFieldsInfo() {
    return [
      {'name': 'rating', 'value': rating},
      {'name': 'review', 'value': review},
      {'name': 'playerOfTheMatch', 'value': playerOfTheMatch},
      {'name': 'homeTeamLineup', 'value': homeTeamLineup?.length ?? 0},
      {'name': 'awayTeamLineup', 'value': awayTeamLineup?.length ?? 0},
      {'name': 'food', 'value': food},
      {'name': 'mood', 'value': mood},
    ];
  }
}
