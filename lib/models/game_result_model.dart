import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'user_model.dart';

part 'game_result_model.g.dart';

@Collection()
class GameResult {
  Id id = Isar.autoIncrement;

  late String result;
  late bool viewingMode = false;
  late String gameTitle;
  late DateTime date;
  late String stadium;
  late String seatLocation;
  late String team1;
  late String team2;
  late String score1;
  late String score2;
  bool team1IsMyTeam = false;
  bool team2IsMyTeam = false;
  late String comment;
  late String pictureUrl;

  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;

  final user = IsarLink<User>();
  final reviews = IsarLinks<GameReview>();
}
