import 'package:isar/isar.dart';
import 'package:stikku_frontend/constants/result_enum.dart'; // GameResultType enum import
import 'user_model.dart';
import 'game_review_model.dart';

part 'game_result_model.g.dart';

@Collection()
class GameResult {
  Id id = Isar.autoIncrement;

  // 필수 필드
  @Enumerated(EnumType.name) // EnumType.name을 사용하여 String으로 저장
  late GameResultType result;

  late DateTime date;

  // t/f 필드
  bool viewingMode = false;
  bool team1IsMyTeam = false;
  bool team2IsMyTeam = false;
  bool isFavorite = false;

  // 시작시 nullable이지만 필수적인 필드
  String? gameTitle;
  String? stadium;
  String? seatLocation;
  String? team1;
  String? team2;
  String? score1;
  String? score2;

  // 옵션 필드
  String? comment;
  String? pictureUrl;

  // game reviews (옵션)
  final gameReview = IsarLink<GameReview>();

  @Index()
  DateTime? createdAt;
  @Index()
  DateTime? updatedAt;

  final user = IsarLink<User>();

  GameResult({
    required this.result,
    required this.date,
    this.viewingMode = false,
    this.gameTitle,
    this.stadium,
    this.seatLocation,
    this.team1,
    this.team2,
    this.score1,
    this.score2,
    this.team1IsMyTeam = false,
    this.team2IsMyTeam = false,
    this.comment,
    this.pictureUrl,
    this.isFavorite = false,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  // toJson: 객체를 Map<String, dynamic>으로 변환
  Map<String, dynamic> toJson() => {
        'id': id,
        'result': result.name, // Enum을 String으로
        'date': date.toIso8601String(),
        'viewingMode': viewingMode,
        'team1IsMyTeam': team1IsMyTeam,
        'team2IsMyTeam': team2IsMyTeam,
        'isFavorite': isFavorite,
        'gameTitle': gameTitle,
        'stadium': stadium,
        'seatLocation': seatLocation,
        'team1': team1,
        'team2': team2,
        'score1': score1,
        'score2': score2,
        'comment': comment,
        'pictureUrl': pictureUrl,
      };

  // fromJson: Map<String, dynamic>으로부터 객체 생성
  static GameResult fromJson(Map<String, dynamic> json) {
    return GameResult(
      result: GameResultType.values.firstWhere((e) => e.name == json['result']),
      date: DateTime.parse(json['date']),
      viewingMode: json['viewingMode'] ?? false,
      gameTitle: json['gameTitle'],
      stadium: json['stadium'],
      seatLocation: json['seatLocation'],
      team1: json['team1'],
      team2: json['team2'],
      score1: json['score1'],
      score2: json['score2'],
      team1IsMyTeam: json['team1IsMyTeam'] ?? false,
      team2IsMyTeam: json['team2IsMyTeam'] ?? false,
      comment: json['comment'],
      pictureUrl: json['pictureUrl'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
