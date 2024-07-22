import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/user_model.dart';
import 'package:stikku_frontend/config/isar_db.dart';

class IsarService extends GetxController {
  final Isar _isar;
  IsarService() : _isar = Get.find<IsarDB>().isar;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    // await deleteDefaultUser();
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

  Future<List<Event>> getEvents(DateTime day) async {
    return _isar.events.filter().eventDateEqualTo(day).findAllSync();
  }

  // submit 함수
  Future<GameResult> postSubmit(Map data) async {
    final user =
        await _isar.users.where().findFirst(); // 임시로 1, 로컬 스토리지 참조하여 구함
    // GameResult 객체 생성 및 저장

    if (user != null) {
      final gameResult = GameResult()
        ..stadium = data["stadium"].value
        ..seatLocation = data["seatLocation"].value
        ..result = data["result"].value
        ..viewingMode = data["viewingMode"].value
        ..team1 = data["team1"].value
        ..team2 = data["team2"].value
        ..score1 = data["score1"].value
        ..score2 = data["score2"].value
        ..team1IsMyTeam = data["team1IsMyTeam"].value
        ..team2IsMyTeam = data["team2IsMyTeam"].value
        ..gameTitle = data["title"]?.value
        ..comment = data["comment"]?.value
        ..pictureUrl = ''
        ..date = data["date"].toUtc()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..reviewComment = data["review"]?.value
        ..playerOfTheMatch = data["playerOfTheMatch"]?.value
        ..food = data["food"]?.value
        ..isFavorite = data["isFavorite"]
        ..user.value = user;

      // Event 객체 생성 및 필요한 필드를 설정합니다.
      final event = Event()
        ..eventDate = data["date"].toUtc()
        ..eventDetails = [data["result"].value]; // 경기 결과를 이벤트 디테일로 저장

      // 트랜잭션을 사용하여 GameResult와 Event를 데이터베이스에 저장하고, User와의 관계를 설정합니다.
      await _isar.writeTxn(() async {
        // GameResult 저장
        await _isar.gameResults.put(gameResult);
        user.gameResults.add(gameResult);

        // Event 저장
        await _isar.events.put(event);
        user.events.add(event);

        // 관계 저장
        await user.gameResults.save();
        await user.events.save();
      });
      return gameResult;
    }
    return GameResult();
  }

  // 날짜별 이벤트를 가져오는 함수
  List<Event> getEventsForDay(DateTime day) {
    return _isar.events.filter().eventDateEqualTo(day).findAllSync();
  }

  Future<void> deleteDetails(DateTime date) async {
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

    // 특정 날짜의 events 가져오기
    final events = await _isar.events.filter().eventDateEqualTo(date).findAll();

    // gameResults 및 events 삭제
    await _isar.writeTxn(() async {
      for (var result in gameResults) {
        await _isar.gameResults.delete(result.id);
      }

      for (var event in events) {
        await _isar.events.delete(event.id);
      }
    });

    print('GameResults and Events for date $date deleted successfully');
  }

// update 함수
  Future<GameResult> updateSubmit(Map data) async {
    final user =
        await _isar.users.where().findFirst(); // 임시로 1, 로컬 스토리지 참조하여 구함

    if (user != null) {
      // 기존 GameResult와 Event 찾기
      final gameResult = await _isar.gameResults
          .filter()
          .dateEqualTo(data["date"].toUtc())
          .findFirst();

      final event = gameResult != null
          ? await _isar.events
              .where()
              .filter()
              .eventDateEqualTo(gameResult.date)
              .findFirst()
          : null;

      if (gameResult != null && event != null) {
        // GameResult 업데이트
        gameResult
          ..stadium = data["stadium"].value
          ..seatLocation = data["seatLocation"].value
          ..result = data["result"].value
          ..viewingMode = data["viewingMode"].value
          ..team1 = data["team1"].value
          ..team2 = data["team2"].value
          ..score1 = data["score1"].value
          ..score2 = data["score2"].value
          ..team1IsMyTeam = data["team1IsMyTeam"].value
          ..team2IsMyTeam = data["team2IsMyTeam"].value
          ..gameTitle = data["title"]?.value
          ..comment = data["comment"]?.value
          ..pictureUrl = ''
          ..date = data["date"].toUtc()
          ..updatedAt = DateTime.now()
          ..reviewComment = data["review"]?.value
          ..playerOfTheMatch = data["playerOfTheMatch"]?.value
          ..food = data["food"]?.value
          ..isFavorite = data["isFavorite"]
          ..user.value = user;

        // Event 업데이트
        event
          ..eventDate = data["date"].toUtc()
          ..eventDetails = [data["result"].value]; // 경기 결과를 이벤트 디테일로 저장

        // 트랜잭션을 사용하여 GameResult와 Event를 데이터베이스에 업데이트하고, User와의 관계를 갱신합니다.
        await _isar.writeTxn(() async {
          // GameResult 업데이트
          await _isar.gameResults.put(gameResult);

          // Event 업데이트
          await _isar.events.put(event);

          // 관계 저장
          await user.gameResults.save();
          await user.events.save();
        });

        // table_calendar에 이벤트 업데이트
        final calendarEvents =
            <DateTime, List<Event>>{}; // 기존에 생성된 이벤트 맵을 가져옵니다.
        final eventDate = data["date"].toUtc();
        if (calendarEvents[eventDate] != null) {
          calendarEvents[eventDate]!
              .removeWhere((e) => e.eventDate == event.eventDate);
          calendarEvents[eventDate]!.add(event);
        } else {
          calendarEvents[eventDate] = [event];
        }

        return gameResult;
      }
    }
    return GameResult();
  }
}
