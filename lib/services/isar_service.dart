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
    // await _deleteDefaultUser();
    await _addDefaultUser();
  }

  // 임시 게스트용 isar user 생성
  Future<void> _addDefaultUser() async {
    final existingUser = isar.users.getSync(1);

    if (existingUser == null) {
      final defaultUser = User()
        ..username = 'GUEST'
        ..password = ''
        ..email = ''
        ..profileImage = ''
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      await isar.writeTxn(() async {
        await isar.users.put(defaultUser);
      });
    }
  }

  Future<void> _deleteDefaultUser() async {
    await isar.writeTxn(() async {
      await isar.users.delete(1);
      // final success = await isar.users.delete(1);
      // print('Recipe deleted: $success');
    });
  }

  Future<User?> getUser() async {
    return await isar.users.where().findFirst();
  }

  // 유저 다 보여 줍니다
  Future<List<User>> getAllUsers() async {
    final users = await isar.users.where().findAll();
    return users;
  }

  Future<void> printAllUsers() async {
    final users = await getAllUsers();
    for (var user in users) {
      print('User: ${user.username}, 님 반갑습니다. ${user.id}번 id입니다.');
    }
  }
}
