import 'package:isar/isar.dart';
import 'user_model.dart';

part 'settings_model.g.dart';

@Collection()
class Settings {
  Id id = Isar.autoIncrement;

  late String nickname;
  bool isDarkMode = false;

  @Index()
  late DateTime createdAt;

  final user = IsarLink<User>();
}
