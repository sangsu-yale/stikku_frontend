import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/models/event_model.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/models/game_review_model.dart';
import 'package:stikku_frontend/models/user_model.dart';
import 'package:stikku_frontend/config/isar_db.dart';
import 'package:stikku_frontend/utils/services/api_game_service.dart';
import 'package:stikku_frontend/utils/services/api_user_service.dart';
import 'package:uuid/uuid.dart';

class IsarService extends GetxController {
  final Isar _isar;
  IsarService() : _isar = Get.find<IsarDB>().isar;

// <------------------- 유저 CRUD -------------------->
// <------------------- 유저 CRUD -------------------->
// <------------------- 유저 CRUD -------------------->

  // ✅ 게스트용(로그인 전) isar user 생성
  Future<void> addDefaultUser() async {
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
  }

  // 유저 완전 삭제
  Future<void> deleteDefaultUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = await getUser();
    final accessToken = prefs.getString('accessToken');
    final isLogin = prefs.getBool('isLogin');

    // 만약에 서버가 연결되어 있으면?
    if (isLogin == true && accessToken != null) {
      // 서버 연결
      await deleteUser(user.serverId, accessToken);
    }
    await _isar.writeTxn(() async {
      await _isar.users.clear();
      await _isar.gameResults.clear();
      await _isar.gameReviews.clear();
      await _isar.events.clear();
    });
    await prefs.clear();
    print("유저가 삭제되었습니다.");
  }

  // 데이터 전체 삭제하기
  Future<void> deleteAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final user = await getUser();
    final isLogin = prefs.getBool('isLogin');

    // 만약에 서버가 연결되어 있으면?
    if (isLogin == true) {
      // 서버 연결
      await deleteAllGameResult(user.serverId);
    }

    await _isar.writeTxn(() async {
      await _isar.gameResults.clear();
      await _isar.gameReviews.clear();
      await _isar.events.clear();
    });
    await prefs.remove('isFavorite');

    print("데이터가 삭제되었습니다.");
  }

  Future<void> printAllUsers() async {
    // 로그를 통해 저장된 사용자 정보 확인
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final isLogin = prefs.getBool('isLogin');
    final users = await _isar.users.where().findAll();
    print("저장된 사용자: ${users[0].username}, $isLogin");
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

  Future<void> changeUsername(String username) async {
    final localuser = await getUser();
    final serverUser = User()
      ..uuid = localuser.uuid
      ..id = localuser.id
      ..username = username
      ..serverId = localuser.serverId
      ..email = localuser.email
      ..profileImage = localuser.profileImage
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
    final pictureLocalPath = data["pictureLocalPath"];
    dynamic localPath;

    // 1. 이미지가 있다면?
    if (pictureLocalPath != null) {
      // 서버 연결
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isLogin = prefs.getBool('isLogin');
      if (isLogin == true) {
        // 서버 이미지 연동
        gameResultObj["pictureUrl"] = await getImageUrl(pictureLocalPath);
      }

      // 로컬 작업
      localPath = pictureLocalPath.path.toString();
    } else {
      // 이미지 선택 안 했을 시 null 처리
      gameResultObj["pictureUrl"] = null;
      localPath = null;
    }

    // 2. 로컬
    final gameReview = GameReview()
      ..uuid = gameReviewObj["uuid"]
      ..serverId = 0
      ..review = gameReviewObj["review"]
      ..rating = gameReviewObj["rating"]
      ..playerOfTheMatch = gameReviewObj["playerOfTheMatch"]
      ..mood = gameReviewObj["mood"]
      ..homeTeamLineup = gameReviewObj["homeTeamLineup"]
      ..awayTeamLineup = gameReviewObj["awayTeamLineup"]
      ..food = gameReviewObj["food"];

    final gameResult = GameResult()
      ..uuid = gameResultObj["uuid"]
      ..serverId = 0
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
      ..pictureLocalPath = localPath // 이미지 기능 추가, File이 아닌 stirng으로 저장됨
      ..pictureUrl = gameResultObj["pictureUrl"]
      ..date = gameResultObj["date"].toUtc()
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now()
      ..isFavorite = gameResultObj["isFavorite"] ?? false;

    // Event 객체 생성 및 필요한 필드를 설정합니다.
    final event = Event()
      ..eventDate = gameResultObj["date"]
      ..eventDetails = [
        gameResultObj["result"].toString().split('.').last
      ]; // 경기 결과를 이벤트 디테일로 저장

    // 3. 서버
    // 만약에 서버가 연결되어 있으면?
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('isLogin');
    if (isLogin == true) {
      // 서버 연결
      // 형변환 정리
      gameResultObj["userId"] = user.serverId;
      gameResultObj["result"] =
          gameResultObj["result"].toString().split('.').last;
      gameResultObj["date"] =
          data["gameResult"]["date"].toIso8601String(); // 시간변환

      // 서버 id
      final Map<String, dynamic> serverId = await postGameResult(data);

      if (serverId.isNotEmpty) {
        // 만약에 서버 id를 받았으면 로컬에 서버 id 동기화
        gameResult.serverId = serverId["serverGameResultID"];
        gameReview.serverId = serverId["serverGameReviewID"];
      }
    }

    // 관계 설정
    gameResult.gameReview.value = gameReview;
    gameResult.user.value = user;
    gameReview.gameResult.value = gameResult;

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

    return gameResult;
  }

// 티켓 업데이트 함수
  Future<GameResult> updateSubmit(Map data) async {
    // 유저 GET
    final user = await getUser();

    final gameResultObj = data["gameResult"];
    final gameReviewObj = data["gameReview"];

    // 기존 GameResult 찾기 (uuid 사용)
    final gameResult = await _isar.gameResults
        .filter()
        .uuidEqualTo(gameResultObj["uuid"])
        .findFirst();

    // 이미지 처리
    final pictureLocalPath = data["pictureLocalPath"]; // File
    dynamic localPath;

    // 만약에 받아온 이미지가 있다면?
    if (pictureLocalPath != null && gameResult != null) {
      // 같은 이미지인지 판별하기
      final isSame =
          gameResult.pictureLocalPath == pictureLocalPath.path.toString();

      // 다른 이미지
      if (!isSame) {
        // 서버 연결
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final isLogin = prefs.getBool('isLogin');
        if (isLogin == true) {
          // 서버 이미지 연동
          gameResultObj["pictureUrl"] = await getImageUrl(pictureLocalPath);
        }

        // 로컬 작업
        localPath = pictureLocalPath.path.toString();
      } else {
        // 같은 이미지
        gameResultObj["pictureUrl"] = gameResult.pictureUrl;
        localPath = gameResult.pictureLocalPath;
      }
    } else {
      // 이미지 선택 안 했을 시 null 처리
      gameResultObj["pictureUrl"] = null;
      localPath = null;
    }

    final event = gameResult != null
        ? await _isar.events
            .filter()
            .eventDateEqualTo(gameResult.date!)
            .findFirst()
        : null;

    if (event != null && gameResult != null) {
      // GameResult 업데이트
      gameResult
        ..uuid = gameResult.uuid
        ..serverId = gameResult.serverId
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
        ..pictureLocalPath = localPath // 이미지 기능 추가, File이 아닌 stirng으로 저장됨
        ..pictureUrl = gameResultObj["pictureUrl"]
        ..date = gameResultObj["date"].toUtc()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..isFavorite = gameResultObj["isFavorite"] ?? false;

      // GameReview가 연결되어 있다면 업데이트

      await gameResult.gameReview.load();
      final gameReview = gameResult.gameReview.value!;

      gameReview
        ..uuid = gameReview.uuid
        ..serverId = gameReview.serverId
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

      // 만약에 서버가 연결되어 있으면?
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isLogin = prefs.getBool('isLogin');
      if (isLogin == true) {
        // 서버 연결
        // 형변환 정리
        gameResultObj["userId"] = user.serverId;
        gameResultObj["result"] =
            gameResultObj["result"].toString().split('.').last;
        gameResultObj["date"] = gameResultObj["date"].toIso8601String();

        updateGameResult(gameResultObj["uuid"], data);
      }

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

      return gameResult;
    } else {
      return GameResult();
    }
  }

// 임시 게스트 때 썼던 티켓을 로그인시 서버로 넘겨 주는 작업
  Future<void> syncLocalToServer() async {
    // 서버에 있는 내용물 전체 가지고 와서 로컬에 연동시키기
    final User user = await getUser();
    List<dynamic> list = await getAllTicketListFromServer(user.serverId);

    if (list.isNotEmpty) {
      for (var e in list) {
        final GameResult? haveTicket = await _isar.gameResults
            .filter()
            .uuidEqualTo(e["gameResult"]["uuid"])
            .findFirst();

        if (haveTicket != null) continue;

        int gameResultServerId = e["gameResult"]["id"];
        int gameReviewServerId = e["gameReview"]["id"];
        e["gameResult"]["serverId"] = gameResultServerId;
        e["gameReview"]["serverId"] = gameReviewServerId;
        e["gameResult"].remove('id');
        e["gameReview"].remove('id');
        e["gameResult"].remove('userId');

        GameResult gameResult = GameResult.fromJson(e["gameResult"]);
        GameReview gameReview = GameReview.fromJson(e["gameReview"]);

        // Event 객체 생성
        final event = Event()
          ..eventDate = gameResult.date!
          ..eventDetails = [
            gameResult.result?.toString().split('.').last ?? ''
          ];

        // 관계 설정
        gameResult.gameReview.value = gameReview;
        gameResult.user.value = user;
        gameReview.gameResult.value = gameResult;

        // 데이터베이스에 저장
        await _isar.writeTxn(() async {
          await _isar.gameReviews.put(gameReview);
          await _isar.gameResults.put(gameResult);
          user.gameResults.add(gameResult);
          await _isar.events.put(event);
          user.events.add(event);
          await gameResult.gameReview.save();
          await gameResult.user.save();
          await user.gameResults.save();
          await user.events.save();
        });
      }
    }
  }

// 티켓 삭제 함수
  Future<void> deleteSubmit(String uuid) async {
    // 유저 GET
    final user = await getUser();

    // 기존 GameResult와 Event 찾기
    final gameResult =
        await _isar.gameResults.filter().uuidEqualTo(uuid).findFirst();

    final event = gameResult != null
        ? await _isar.events
            .filter()
            .eventDateEqualTo(gameResult.date!)
            .findFirst()
        : null;

    if (gameResult != null && event != null) {
      // 만약에 서버가 연결되어 있으면?
      //  서버부터 삭제
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isLogin = prefs.getBool('isLogin');
      // 서버 연동
      if (isLogin == true) {
        deleteGameResult(uuid);
        // 맵핑 테이블에서 게임 아이디 받아와야 함
        // 로컬 디비 아이디로 받아올 수 있지
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
      // 서버 연결
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final isLogin = prefs.getBool('isLogin');
      if (isLogin == true) {
        putGameFavorite(gameResult.isFavorite, gameResult.uuid!);
      }

      await _isar.writeTxn(() async {
        gameResult.isFavorite = !gameResult.isFavorite;
        await _isar.gameResults.put(gameResult);
      });
    }
    return gameResult!;
  }
}
