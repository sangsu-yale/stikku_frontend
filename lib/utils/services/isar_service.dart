import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_id_mapping_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'package:stikku_frontend/models/user_model.dart';
import 'package:stikku_frontend/config/isar_db.dart';
import 'package:stikku_frontend/utils/services/api_service.dart';
import 'package:uuid/uuid.dart';

class IsarService extends GetxController {
  final Isar _isar;
  IsarService() : _isar = Get.find<IsarDB>().isar;

  var isLogin = false.obs;
  var userName = '게스트'.obs;
  var userEmail = ''.obs;
  var userUuid = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  // 시작 시 게스트 로그인 확인
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isUserCreated = prefs.getBool('isUserCreated');
    final bool? isUserLogin = prefs.getBool('isLogin');

    // 없으면 유저 만들고
    if (isUserCreated == null || !isUserCreated) {
      await _addDefaultUser();
      await prefs.setBool('isUserCreated', true);
    } else {
      // 만약에 로그인 했으면
      if (isUserLogin == true) {
        // 로그인한 상황으로
        userName.value = prefs.getString('username')!;
      } else {}
      // 있으면 유지시켜
      isLogin.value = prefs.getBool('isLogin') ?? false;
      userUuid.value = prefs.getString('uuid') ?? '';
      userName.value =
          '게스트-${userUuid.value == '' ? null : userUuid.value.substring(0, 8).toUpperCase()}';
    }

    // TODO: 디버깅용
    // await deleteDefaultUser();
    await _printAllUsers();
  }
// <------------------- 유저 CRUD -------------------->
// <------------------- 유저 CRUD -------------------->
// <------------------- 유저 CRUD -------------------->

  // ✅ 게스트용(로그인 전) isar user 생성
  Future<void> _addDefaultUser() async {
    final defaultUser = User()
      ..uuid = const Uuid().v4()
      ..serverId = 0
      ..username = 'GUEST'
      ..email = ''
      ..profileImage = ''
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.users.put(defaultUser);
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', defaultUser.username);
    await prefs.setString('email', defaultUser.email);
    await prefs.setString('uuid', defaultUser.uuid);

    isLogin.value = prefs.getBool('isLogin') ?? false;
    userName.value = prefs.getString('userName') ?? 'GUEST';
    userEmail.value = prefs.getString('userEmail') ?? '';
    userUuid.value = prefs.getString('uuid') ?? '';

    if (!isLogin.value) {
      // 게스트 초기값 설정
      userName.value =
          '게스트-${userUuid.value == '' ? null : userUuid.value.substring(0, 8).toUpperCase()}';
    }
  }

  // 로그아웃은 조금 더 생각해 봅시다 (회원 탈퇴임)
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', false);
    await prefs.remove('userName');
    await prefs.remove('userEmail');

    initialize();
  }

  // 유저 완전 삭제
  // TODO: 유저 삭제(탈퇴)하기
  Future<void> deleteDefaultUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _isar.writeTxn(() async {
      await _isar.users.clear();
      await _isar.gameResults.clear();
      await _isar.gameReviews.clear();
      await _isar.gameResultIdMappings.clear();
      await _isar.events.clear();
    });
    await prefs.clear();

    print("유저가 삭제되었습니다.");
  }

  // 데이터만 삭제하기
  Future<void> deleteAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await _isar.writeTxn(() async {
      await _isar.gameResults.clear();
      await _isar.gameReviews.clear();
      await _isar.gameResultIdMappings.clear();
      await _isar.events.clear();
    });
    await prefs.remove('isFavorite');

    // TODO: 데이터 전체 삭제 : 서버 데이터와 연동이 되어야 합니다
    print("데이터가 삭제되었습니다.");
  }

  Future<void> _printAllUsers() async {
    // 로그를 통해 저장된 사용자 정보 확인
    final users = await _isar.users.where().findAll();
    print("저장된 사용자: $users");
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

  // (서버 연동) 유저 업데이트
  Future<void> updateUser(
      int serverId, String username, String email, String profileImage) async {
    final localuser = await getUser();
    final serverUser = User()
      ..uuid = localuser.uuid
      ..id = localuser.id
      ..username = username
      ..serverId = serverId
      ..email = email
      ..profileImage = profileImage
      ..createdAt = localuser.createdAt
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.users.put(serverUser);
    });
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
      // 1. 로컬 데이터 반환
      // 특정 날짜의 gameResults 가져오기
      final gameResults =
          await _isar.gameResults.filter().dateEqualTo(date).findAll();

      if (gameResults.isNotEmpty) {
        return gameResults[0]; // 만약 여러 개라면 첫 번째 결과를 반환
      }

      // 2. 만약에 없으면? 서버에서 데이터 가지고 오기
      // final serverData = await getDetailsFormServer(date);

      return GameResult();
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: '앗! 문제가 있나 봐요!',
          message: '개발진에게 문의를 부탁드려요',
          duration: Duration(seconds: 3),
        ),
      );
      // 필요시 에러 메시지를 담은 GameResult 반환 또는 예외 재발생
      throw Exception('티켓 반환 실패: $e');
    }
  }

  // 티켓 생성 함수
  Future<GameResult> postSubmit(Map data) async {
// 유저 GET
    final user = await getUser();

    final gameResultObj = data["gameResult"];
    final gameReviewObj = data["gameReview"];

    print("postSubmit에서 들어온 데이터 : ${gameResultObj["date"]}");

    final gameReview = GameReview()
      ..review = gameReviewObj["review"]
      ..rating = gameReviewObj["rating"]
      ..playerOfTheMatch = gameReviewObj["playerOfTheMatch"]
      ..mood = gameReviewObj["mood"]
      ..homeTeamLineup = gameReviewObj["homeTeamLineup"]
      ..awayTeamLineup = gameReviewObj["awayTeamLineup"]
      ..food = gameReviewObj["food"];

    final gameResult = GameResult()
      ..stadium = gameResultObj["stadium"]
      ..seatLocation = gameResultObj["seatLocation"]
      ..result = gameResultObj["result"]
      ..viewingMode = gameResultObj["isLiveView"]
      ..team1 = gameResultObj["team1"]
      ..team2 = gameResultObj["team2"]
      ..score1 = gameResultObj["score1"]
      ..score2 = gameResultObj["score2"]
      ..team1IsMyTeam = gameResultObj["team1IsMyTeam"] ?? false
      ..team2IsMyTeam = gameResultObj["team2IsMyTeam"] ?? false
      ..gameTitle = gameResultObj["title"]
      ..comment = gameResultObj["comment"]
      ..pictureUrl = ''
      ..date = gameResultObj["date"].toUtc()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isFavorite = gameResultObj["isFavorite"] ?? false;

    // 관계 설정
    gameResult.gameReview.value = gameReview;
    gameResult.user.value = user;
    gameReview.gameResult.value = gameResult;

    // Event 객체 생성 및 필요한 필드를 설정합니다.
    final event = Event()
      ..eventDate = gameResultObj["date"].toUtc()
      ..eventDetails = [
        gameResultObj["result"].toString().split('.').last
      ]; // 경기 결과를 이벤트 디테일로 저장

    await _isar.writeTxn(() async {
      // GameReview 저장
      await _isar.gameReviews.put(gameReview);

      // GameResult 저장
      await _isar.gameResults.put(gameResult);
      user.gameResults.add(gameResult);

      // Event 저장
      await _isar.events.put(event);
      user.events.add(event);

      // 관계 저장
      await gameResult.gameReview.save();
      await gameResult.user.save();
      await user.gameResults.save();
      await user.events.save();
    });

    // 만약에 서버가 연결되어 있으면?
    if (user.serverId != 0) {
      // 서버 연결
      gameResultObj["userId"] = user.serverId;

      // 맵핑 테이블 생성
      final Map<String, dynamic> serverIDs = await postGameResult(data);

      final mapping = GameResultIdMapping(
          localGameResultId: gameResult.id,
          serverGameResultId: serverIDs["serverGameResultID"],
          serverGameReviewId: serverIDs["serverGameReviewID"]);

      // 매핑 테이블에 저장
      await _isar.writeTxn(() async {
        await _isar.gameResultIdMappings.put(mapping);
      });
    }

    return gameResult;
  }

// 티켓 업데이트 함수
  Future<GameResult> updateSubmit(Map data) async {
    // 유저 GET
    final user = await getUser();

    final gameResultObj = data["gameResult"];
    final gameReviewObj = data["gameReview"];

    // 기존 GameResult와 Event 찾기
    final gameResult = await _isar.gameResults
        .filter()
        .dateEqualTo(gameResultObj["date"])
        .findFirst();

    print("업데이트 에서 들어온 데이터 : ${gameResultObj["date"]}");

    final event = gameResult != null
        ? await _isar.events
            .filter()
            .eventDateEqualTo(gameResult.date!)
            .findFirst()
        : null;

    if (gameResult != null && event != null) {
      // GameResult 업데이트
      gameResult
        ..stadium = gameResultObj["stadium"]
        ..seatLocation = gameResultObj["seatLocation"]
        ..result = gameResultObj["result"]
        ..viewingMode = gameResultObj["isLiveView"]
        ..team1 = gameResultObj["team1"]
        ..team2 = gameResultObj["team2"]
        ..score1 = gameResultObj["score1"]
        ..score2 = gameResultObj["score2"]
        ..team1IsMyTeam = gameResultObj["team1IsMyTeam"] ?? false
        ..team2IsMyTeam = gameResultObj["team2IsMyTeam"] ?? false
        ..gameTitle = gameResultObj["title"]
        ..comment = gameResultObj["comment"]
        ..pictureUrl = ''
        ..date = gameResultObj["date"].toUtc()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..isFavorite = gameResultObj["isFavorite"] ?? false;

      // GameReview가 연결되어 있다면 업데이트

      await gameResult.gameReview.load();
      final gameReview = gameResult.gameReview.value!;
      gameReview
        ..review = gameReviewObj["review"]
        ..rating = gameReviewObj["rating"]
        ..playerOfTheMatch = gameReviewObj["playerOfTheMatch"]
        ..mood = gameReviewObj["mood"]
        ..homeTeamLineup = gameReviewObj["homeTeamLineup"]
        ..awayTeamLineup = gameReviewObj["awayTeamLineup"]
        ..food = gameReviewObj["food"]; // GameReview 업데이트

      // Event 업데이트
      event
        ..eventDate = gameResultObj["date"].toUtc()
        ..eventDetails = [
          gameResultObj["result"].toString().split('.').last
        ]; // 문자열 변환 필요

      // 트랜잭션을 사용하여 GameResult와 Event를 데이터베이스에 업데이트하고, User와의 관계를 갱신합니다.
      await _isar.writeTxn(() async {
        // GameResult 업데이트
        await _isar.gameResults.put(gameResult);
        await _isar.gameReviews.put(gameReview);

        // Event 업데이트
        await _isar.events.put(event);

        // 관계 저장
        await gameResult.gameReview.save();
        await gameResult.user.save();
        await user.gameResults.save();
        await user.events.save();
      });

      // 만약에 서버가 연결되어 있으면?
      if (user.serverId != 0) {
        // 맵핑 테이블에서 게임 아이디 받아와야 함
        // 로컬 디비 아이디로 받아올 수 있지
        final mapping = await _isar.gameResultIdMappings
            .filter()
            .localGameResultIdEqualTo(gameResultObj["id"])
            .findFirst();

        // 받아와서 넘겨주기
        if (mapping != null) {
          updateGameResult(mapping.serverGameResultId, data);
        }
      }

      return gameResult;
    } else {
      return GameResult();
    }
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
            .filter()
            .eventDateEqualTo(gameResult.date!)
            .findFirst()
        : null;

    if (gameResult != null && event != null) {
      // 만약에 서버가 연결되어 있으면?
      //  서버부터 삭제
      if (user.serverId != 0) {
        // 맵핑 테이블에서 게임 아이디 받아와야 함
        // 로컬 디비 아이디로 받아올 수 있지
        final mapping = await _isar.gameResultIdMappings
            .filter()
            .localGameResultIdEqualTo(gameResult.id)
            .findFirst();

        // 받아와서 넘겨주기
        if (mapping != null) {
          deleteGameResult(mapping.serverGameResultId);

          // mapping 삭제
          await _isar.writeTxn(() async {
            await _isar.gameResultIdMappings.delete(mapping.id);
          });
        }
      }

      // 트랜잭션을 사용하여 GameResult와 Event를 데이터베이스에서 삭제하고, User와의 관계를 갱신합니다.
      await _isar.writeTxn(() async {
        // GameReview 삭제
        if (gameResult.gameReview.isAttached) {
          await gameResult.gameReview.load();
          await _isar.gameReviews.delete(gameResult.gameReview.value!.id);
        }

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

// <------------------- 통계 GET -------------------->
// <------------------- 통계 GET -------------------->
// <------------------- 통계 GET -------------------->
// GET : 통계 차트
  Future<List<GameResult>> getChartData() async {
    // 특정 날짜의 gameResults 가져오기
    final gameResults = await _isar.gameResults.where().findAll();

    return gameResults;
  }

// <------------------- 리스트 -------------------->
// <------------------- 리스트 -------------------->
// <------------------- 리스트 -------------------->

// 전체 불러오기
  Future<List<GameResult>> loadGameResultFromLocalDB() async {
    return await _isar.gameResults.where().findAll();
  }

// 토글
  Future<GameResult> onOffTofavorite(int id) async {
    final gameResult = await _isar.gameResults.get(id);

    if (gameResult != null) {
      final mapping = await _isar.gameResultIdMappings
          .filter()
          .localGameResultIdEqualTo(gameResult.id)
          .findFirst();

      if (mapping != null) {
        putGameFavorite(mapping.serverGameResultId, gameResult.isFavorite);
      }

      await _isar.writeTxn(() async {
        gameResult.isFavorite = !gameResult.isFavorite;
        await _isar.gameResults.put(gameResult);
      });
    }
    return gameResult!;
  }
}
