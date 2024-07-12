import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'user_model.dart';

part 'game_result_model.g.dart';

@Collection()
class GameResult {
  Id id = Isar.autoIncrement;

  late String result;
  late String viewingMode;
  late String gameTitle;
  late DateTime date;
  String? stadium;
  String? seatLocation;
  late String team1;
  late String team2;
  late int score1;
  late int score2;
  bool team1IsMyteam = false;
  bool team2IsMyteam = false;
  String? comment;
  String? pictureUrl;

  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;

  final user = IsarLink<User>();
  final reviews = IsarLinks<GameReview>();
}
