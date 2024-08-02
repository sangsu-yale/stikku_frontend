import 'package:isar/isar.dart';
import 'user_model.dart';

part 'game_result_model.g.dart';

@embedded
class GameReview {
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

@Collection()
class GameResult {
  Id id = Isar.autoIncrement;

  // game results
  late String result;
  late bool viewingMode = false;
  String? gameTitle;
  late DateTime date;
  late String stadium;
  late String seatLocation;
  late String team1;
  late String team2;
  late String score1;
  late String score2;
  bool team1IsMyTeam = false;
  bool team2IsMyTeam = false;
  String? comment;
  late String pictureUrl;

  // game reviews (옵션)
  GameReview? gameReview;

  bool isFavorite = false;

  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;

  final user = IsarLink<User>();
}
