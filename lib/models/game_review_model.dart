// game_review_model.dart

import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:uuid/uuid.dart';

part 'game_review_model.g.dart';

@Collection()
class GameReview {
  Id id = Isar.autoIncrement; // ID 추가
  String? uuid;
  int? serverId;

  String? review;
  int? rating;
  String? playerOfTheMatch;
  String? mood;
  List<String>? homeTeamLineup;
  List<String>? awayTeamLineup;
  String? food;

  GameReview({
    this.serverId,
    this.review,
    this.rating,
    this.playerOfTheMatch,
    this.mood,
    this.homeTeamLineup,
    this.awayTeamLineup,
    this.food,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();

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

  // toJson: 객체를 Map<String, dynamic>으로 변환
  Map<String, dynamic> toJson() => {
        'id': id,
        'serverId': serverId,
        'uuid': uuid, // UUID 추가
        'review': review,
        'rating': rating,
        'playerOfTheMatch': playerOfTheMatch,
        'mood': mood,
        'homeTeamLineup': homeTeamLineup,
        'awayTeamLineup': awayTeamLineup,
        'food': food,
      };

  // fromJson: Map<String, dynamic>으로부터 객체 생성
  static GameReview fromJson(Map<String, dynamic> json) {
    return GameReview(
      uuid: json['uuid'], // JSON에서 UUID 읽어오기
      serverId: json['serverId'],
      review: json['review'],
      rating: json['rating'],
      playerOfTheMatch: json['playerOfTheMatch'],
      mood: json['mood'],
      homeTeamLineup: List<String>.from(json['homeTeamLineup'] ?? []),
      awayTeamLineup: List<String>.from(json['awayTeamLineup'] ?? []),
      food: json['food'],
    );
  }
}
