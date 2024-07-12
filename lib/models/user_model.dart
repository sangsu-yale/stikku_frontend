import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/settings_model.dart';

part 'user_model.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;

  late String username;
  late String password;
  late String email;
  String? profileImage;

  @Index()
  late DateTime createdAt;

  @Index()
  late DateTime updatedAt;

  final gameResults = IsarLinks<GameResult>();
  final settings = IsarLink<Settings>();
}
