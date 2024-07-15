import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/user_model.dart';
import 'package:stikku_frontend/services/isar_service.dart';

class IsarController extends GetxController {
  final Isar _isar;
  IsarController() : _isar = Get.find<IsarService>().isar;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    // await _deleteDefaultUser();
    await _addDefaultUser();
    await printAllUsers();
  }

  // 임시 게스트용 isar user 생성
  Future<void> _addDefaultUser() async {
    final existingUser = _isar.users.getSync(1);

    if (existingUser == null) {
      final defaultUser = User()
        ..username = 'GUEST'
        ..password = ''
        ..email = ''
        ..profileImage = ''
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();

      await _isar.writeTxn(() async {
        await _isar.users.put(defaultUser);
      });
    }
  }

  // 게스트 삭제
  Future<void> _deleteDefaultUser() async {
    await _isar.writeTxn(() async {
      // 모든 User 데이터를 삭제합니다.
      await _isar.users.clear();

      // 모든 GameResult 데이터를 삭제합니다.
      await _isar.gameResults.clear();

      // 모든 Event 데이터를 삭제합니다.
      await _isar.events.clear();

      // 필요한 경우, 다른 컬렉션들도 위와 같은 방식으로 삭제합니다.
      // 예: await _isar.anotherCollection.clear();
    });
  }

  // 모든 유저 확인
  Future<List<User>> getAllUsers() async {
    final users = await _isar.users.where().findAll();
    return users;
  }

  Future<void> printAllUsers() async {
    final users = await getAllUsers();
    for (var user in users) {
// 모든 GameResult를 로드하고 출력합니다.
      await user.gameResults.load();
      for (var result in user.gameResults) {
        print(
            'Game Title: ${result.gameTitle}, Score: ${result.score1} - ${result.score2}');
        print('Stadium: ${result.stadium}, Seat: ${result.seatLocation}');
        print('Teams: ${result.team1} vs ${result.team2}');
        print('Result: ${result.result}, Viewing Mode: ${result.viewingMode}');
        print('Comment: ${result.comment}');
        print('Date: ${result.date}');
        print('Picture URL: ${result.pictureUrl}');
        print(
            'Created At: ${result.createdAt}, Updated At: ${result.updatedAt}');
        print('-----------------------------');
      }
      print('User: ${user.username}, 님 반갑습니다. ${user.id}번 id입니다.');
    }
  }
}



  // Future<void> init() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   isar = await Isar.open(
  //     [UserSchema, GameResultSchema, GameReviewSchema, SettingsSchema],
  //     directory: dir.path,
  //   );
  //   // await _deleteDefaultUser();
  //   await _addDefaultUser();
  // }

  // // 임시 게스트용 isar user 생성
  // Future<void> _addDefaultUser() async {
  //   final existingUser = isar.users.getSync(1);

  //   if (existingUser == null) {
  //     final defaultUser = User()
  //       ..username = 'GUEST'
  //       ..password = ''
  //       ..email = ''
  //       ..profileImage = ''
  //       ..createdAt = DateTime.now()
  //       ..updatedAt = DateTime.now();

  //     await isar.writeTxn(() async {
  //       await isar.users.put(defaultUser);
  //     });
  //   }
  // }

  // Future<void> _deleteDefaultUser() async {
  //   await isar.writeTxn(() async {
  //     await isar.users.delete(1);
  //     // final success = await isar.users.delete(1);
  //     // print('Recipe deleted: $success');
  //   });
  // }

  // Future<User?> getUser() async {
  //   return await isar.users.where().findFirst();
  // }

  // // 유저 다 보여 줍니다
  // Future<List<User>> getAllUsers() async {
  //   final users = await isar.users.where().findAll();
  //   return users;
  // }

  // Future<void> printAllUsers() async {
  //   final users = await getAllUsers();
  //   for (var user in users) {
  //     print('User: ${user.username}, 님 반갑습니다. ${user.id}번 id입니다.');
  //   }
  // }