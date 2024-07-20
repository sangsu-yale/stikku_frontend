import 'package:isar/isar.dart';
import 'user_model.dart';

part 'game_result_model.g.dart';

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
  String? reviewComment;
  int? rating;
  String? playerOfTheMatch;
  String? mood;
  List<String>? homeTeamLineup;
  List<String>? awayTeamLineup;
  String? food;

  bool isFavorite = false;

  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;

  final user = IsarLink<User>();
}
