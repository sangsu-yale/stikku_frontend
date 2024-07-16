import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uuid = prefs.getString('uuid');

    if (uuid == null) {
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
      // 로컬 스토리지 저장
      await prefs.setString('username', defaultUser.username);
      await prefs.setString('uuid', defaultUser.uuid);
    }
  }

  // 게스트 삭제
  Future<void> deleteDefaultUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _isar.writeTxn(() async {
      // 모든 User 데이터를 삭제합니다.
      await _isar.users.clear();

      // 모든 GameResult 데이터를 삭제합니다.
      await _isar.gameResults.clear();

      // 모든 Event 데이터를 삭제합니다.
      await _isar.events.clear();
    });
    await prefs.remove('username');
    await prefs.remove('uuid');
  }

  // 모든 유저 확인
  Future<List<User>> getAllUsers() async {
    final users = await _isar.users.where().findAll();
    return users;
  }

  // 유저 DB 확인
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
      print('User: ${user.username}, 님 반갑습니다. ${user.uuid}번 id입니다.');
    }
  }

  // gameDetails 가지고 오기 (우선 임시로 이곳에 코드 작성)
  Future<GameResult> getDetails(DateTime date) async {
    // 유저의 uuid 확인하고
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? uuid = prefs.getString('uuid');

    if (uuid == null) {
      throw Exception('User UUID not found in SharedPreferences');
    }

    // 사용자 가져오기
    final user = await _isar.users.filter().uuidEqualTo(uuid).findFirst();

    if (user == null) {
      throw Exception('User not found in the database');
    }

    // 특정 날짜의 gameResults 가져오기
    final gameResults =
        await _isar.gameResults.filter().dateEqualTo(date).findAll();

    if (gameResults.isNotEmpty) {
      return gameResults[0]; // 만약 여러 개라면 첫 번째 결과를 반환
    }

    return GameResult(); // 빈 GameResult 반환
  }
}
