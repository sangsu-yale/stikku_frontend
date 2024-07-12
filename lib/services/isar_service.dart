import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'package:stikku_frontend/models/settings_model.dart';
import 'package:stikku_frontend/models/user_model.dart';

class IsarService {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserSchema, GameResultSchema, GameReviewSchema, SettingsSchema],
      directory: dir.path,
    );
  }
}
