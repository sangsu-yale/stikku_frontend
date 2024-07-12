import 'package:isar/isar.dart';
import 'game_result_model.dart';

part 'game_review_model.g.dart';

@Collection()
class GameReview {
  Id id = Isar.autoIncrement;

  String? reviewComment;
  int? rating;
  String? playerOfTheMatch;
  String? mood;
  String? homeTeamLineup;
  String? awayTeamLineup;
  String? food;

  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;

  final gameResult = IsarLink<GameResult>();
}
