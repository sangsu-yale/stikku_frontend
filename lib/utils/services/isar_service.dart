import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/user_model.dart';
import 'package:stikku_frontend/config/isar_db.dart';
import 'package:uuid/uuid.dart';

class IsarService extends GetxController {
  final Isar _isar;
  IsarService() : _isar = Get.find<IsarDB>().isar;
  var uuid = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  // 시작 시 게스트 로그인 확인
  Future<void> _initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isUserCreated = prefs.getBool('isUserCreated');

    if (isUserCreated == null || !isUserCreated) {
      await _addDefaultUser();
      await prefs.setBool('isUserCreated', true);
    } else {
      uuid.value = prefs.getString('uuid')!.substring(0, 8).toUpperCase();
    }

    // TODO: 나중에 삭제 🚧 모든 사용자 정보를 콘솔에 출력 🚧
    // await deleteDefaultUser();
    await _printAllUsers();
  }

  // TODO: 나중에 삭제 🚧 모든 사용자 정보를 콘솔에 출력 🚧
  Future<void> _printAllUsers() async {
    final users = await _isar.users.where().findAll();
    for (var user in users) {
      print(
          '✅✅✅ 반갑습니다! User: ${user.username}, UUID: ${user.uuid}, 모든 유저를 보여줍니다 ✅✅✅');
    }
  }

// <------------------- 유저 CRUD -------------------->
// <------------------- 유저 CRUD -------------------->
// <------------------- 유저 CRUD -------------------->

  // ✅ 게스트용(로그인 전) isar user 생성
  Future<void> _addDefaultUser() async {
    final defaultUser = User()
      ..uuid = const Uuid().v4() // Uuid 생성
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', defaultUser.username);
    await prefs.setString('uuid', defaultUser.uuid);
  }

  // TODO: 나중에 삭제 🚧 게스트 삭제 🚧
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
    await prefs.remove('isUserCreated');
    // 뻬이보릿도 삭제해야 해

    print("유저가 삭제되었습니다.");
  }

// <------------------- 티켓 CRUD -------------------->
// <------------------- 티켓 CRUD -------------------->
// <------------------- 티켓 CRUD -------------------->

  // 캘린더 날짜별 이벤트를 가져오는 함수
  List<Event> getEventsForDay(DateTime day) {
    return _isar.events.filter().eventDateEqualTo(day).findAllSync();
  }

// GET 티켓 정보
  Future<GameResult> getDetails(DateTime date) async {
    try {
      // 특정 날짜의 gameResults 가져오기
      final gameResults =
          await _isar.gameResults.filter().dateEqualTo(date).findAll();

      if (gameResults.isNotEmpty) {
        return gameResults[0]; // 만약 여러 개라면 첫 번째 결과를 반환
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: '앗! 문제가 있나 봐요!',
            message: '개발진에게 문의를 부탁드려요',
            duration: Duration(seconds: 3),
          ),
        );
        return GameResult();
      }
    } catch (e) {
      // 에러 발생 시 로그 기록
      print('에러가 발생했습니다 : $e');
      // 필요시 에러 메시지를 담은 GameResult 반환 또는 예외 재발생
      throw Exception('티켓 반환 실패: $e');
    }
  }

  Future<User> getUser() async {
    try {
      // 유저의 uuid 확인
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? uuid = prefs.getString('uuid');
      if (uuid == null) throw Exception('UUID 발급이 안 된 유저입니다');

      // 사용자 가져오기
      final user = await _isar.users.filter().uuidEqualTo(uuid).findFirst();
      if (user == null) throw Exception('로컬 DB에 유저가 없습니다');

      return user;
    } catch (e) {
      print('유저 정보를 가지고 오는 과정 중에 에러가 났습니다 : $e');
      throw Exception('Failed to fetch user: $e');
    }
  }

  // 티켓 생성 함수
  Future<GameResult> postSubmit(Map data) async {
    // 유저 GET
    final user = await getUser();

    final gameResult = GameResult()
      ..stadium = data["stadium"]
      ..seatLocation = data["seatLocation"]
      ..result = data["result"]
      ..viewingMode = data["viewingMode"]
      ..team1 = data["team1"]
      ..team2 = data["team2"]
      ..score1 = data["score1"]
      ..score2 = data["score2"]
      ..team1IsMyTeam = data["team1IsMyTeam"] ?? false
      ..team2IsMyTeam = data["team2IsMyTeam"] ?? false
      ..gameTitle = data["gameTitle"]
      ..comment = data["comment"]
      ..pictureUrl = ''
      ..date = data["date"].toUtc()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isFavorite = data["isFavorite"] ?? false
      ..gameReview = GameReview(
        review: data["reviewComment"],
        rating: data["rating"],
        playerOfTheMatch: data["playerOfTheMatch"],
        mood: data["mood"],
        homeTeamLineup: data["homeTeamLineup"]?.cast<String>(),
        awayTeamLineup: data["awayTeamLineup"]?.cast<String>(),
        food: data["food"],
      )
      ..user.value = user;

    // Event 객체 생성 및 필요한 필드를 설정합니다.
    final event = Event()
      ..eventDate = data["date"].toUtc()
      ..eventDetails = [data["result"]]; // 경기 결과를 이벤트 디테일로 저장

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

// 티켓 삭제 함수
  Future<void> deleteSubmit(DateTime date) async {
    // 유저 GET
    final user = await getUser();

    // 기존 GameResult와 Event 찾기
    final gameResult =
        await _isar.gameResults.filter().dateEqualTo(date.toUtc()).findFirst();

    final event = gameResult != null
        ? await _isar.events
            .where()
            .filter()
            .eventDateEqualTo(gameResult.date)
            .findFirst()
        : null;

    if (gameResult != null && event != null) {
      // 트랜잭션을 사용하여 GameResult와 Event를 데이터베이스에서 삭제하고, User와의 관계를 갱신합니다.
      await _isar.writeTxn(() async {
        // GameResult 삭제
        await _isar.gameResults.delete(gameResult.id);

        // Event 삭제
        await _isar.events.delete(event.id);

        // 관계 갱신
        user.gameResults.remove(gameResult);
        user.events.remove(event);

        await user.gameResults.save();
        await user.events.save();
      });
    }
  }

// 티켓 업데이트 함수
  Future<GameResult> updateSubmit(Map data) async {
    // 유저 GET
    final user = await getUser();

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
        ..stadium = data["stadium"]
        ..seatLocation = data["seatLocation"]
        ..result = data["result"]
        ..viewingMode = data["viewingMode"]
        ..team1 = data["team1"]
        ..team2 = data["team2"]
        ..score1 = data["score1"]
        ..score2 = data["score2"]
        ..team1IsMyTeam = data["team1IsMyTeam"]
        ..team2IsMyTeam = data["team2IsMyTeam"]
        ..gameTitle = data["gameTitle"]
        ..comment = data["comment"]
        ..pictureUrl = ''
        ..date = data["date"].toUtc()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..isFavorite = data["isFavorite"] ?? false
        ..gameReview = GameReview(
          review: data["reviewComment"],
          rating: data["rating"],
          playerOfTheMatch: data["playerOfTheMatch"],
          mood: data["mood"],
          homeTeamLineup: data["homeTeamLineup"]?.cast<String>(),
          awayTeamLineup: data["awayTeamLineup"]?.cast<String>(),
          food: data["food"],
        )
        ..user.value = user;

      // Event 업데이트
      event
        ..eventDate = data["date"].toUtc()
        ..eventDetails = [data["result"]]; // 경기 결과를 이벤트 디테일로 저장

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

      return gameResult;
    }
    return GameResult();
  }

// <------------------- 통계 GET -------------------->
// <------------------- 통계 GET -------------------->
// <------------------- 통계 GET -------------------->
// GET : 통계 차트
  Future<List<GameResult>> getChartData() async {
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
    final gameResults = await _isar.gameResults.where().findAll();

    return gameResults;
  }
}
