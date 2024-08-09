import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/models/game_result_model.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

// 로그인 (구글)
// Future<Map<String, dynamic>>
void login() async {
  final isarController = Get.find<IsarService>();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final url = Uri.parse('${dotenv.env['SERVER_URL']}/login/oauth/google');

  // 구글 통신 로그인
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? user = await googleSignIn.signIn();

  // 구글 로그인 성공한 경우
  if (user != null) {
    final GoogleSignInAuthentication auth = await user.authentication;
    final String? authorizationCode = auth.accessToken;

    print("서버에게 보낼 액세스 토큰 : $authorizationCode");
    if (authorizationCode != null) {
      // 서버와 통신

      final String json = jsonEncode(<String, String>{
        'accessToken': authorizationCode,
      });
      final Map<String, String> headers = {
        "content-type": "application/json; charset=utf-8"
      };

      final response = await http.post(url, headers: headers, body: json);
      // user 정보를 isar에 저장

      // 서버와의 인증 성공할 시
      if (response.statusCode == 200) {
        print('POST request successful');
        // "accessToken" 값을 받아옴

        final body = jsonDecode(response.body) as Map<String, dynamic>;

        final String serverAccessToken = body["accessToken"];
        print("서버에서 받아온 토큰이에요 : $serverAccessToken");

        await prefs.setString('accessToken', serverAccessToken);

        // 유저 정보 받아오기(serverID)
        final userInfo = await fetchUser(serverAccessToken);

        // user 업데이트 (유저 업데이트 및 유저 생성은 똑같다)
        isarController.updateUser(userInfo["id"], userInfo["username"],
            userInfo["email"], userInfo["profileImage"]);

        // print(await fetchUserID(4, serverAccessToken));
        // 아닐 시
      } else {
        print('POST request failed with status: ${response.statusCode}');
      }
    }

    Get.toNamed('/');

    // 구글 로그인 실패한 경우
  } else {}
}

// 유저 정보 불러오기 (처음)
Future<Map<String, dynamic>> fetchUser(String accessToken) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users');
  final response =
      await http.get(url, headers: {'Authorization': "Bearer $accessToken"});

  if (response.statusCode == 200) {
    print("유저 정보를 반환");
    print(response.body);
    print(response.headers);
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('유저 정보를 불러오지 못했습니다');
  }
}

// 유저 정보 불러오기 (처음)
Future<Map<String, dynamic>> fetchUserID(
    int serverId, String serverAccessToken) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users/$serverId');
  final response = await http
      .get(url, headers: {'Authorization': "Bearer $serverAccessToken"});
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("유저 정보를 반환 222");
    print(response.body);
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('유저 정보를 불러오지 못했습니다');
  }
}

// 게임Result 포스트
Future<int> postGameResult(Map data) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/games');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('accessToken');

  // 액세스 토큰 있으면
  if (accessToken != null) {
    // 액세스 토큰 헤더에 넣어 줘야 해
    final Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
      "Authorization": "Bearer $accessToken"
    };

    // 바디값 넣어 줘야 함
    final String json = jsonEncode(<dynamic, dynamic>{
      'gameResult': data["gameResult"],
      'gameReview': data["gameReview"]
    });

    // 요청
    final response = await http.post(url, headers: headers, body: json);
    final body = response.body;
    // 만약에 됐으면?
    if (response.statusCode == 201) {
      // 매핑 엔트리 생성
      // 서버 id 보내기
      return 1;
      //
    } else {
      throw Exception('게임 결과를 저장하지 못했습니다 : $body');
    }
  } else {
    throw Exception('유저 정보를 불러오지 못했습니다');
  }
}

// 게임Result 포스트
Future<GameResult> getDetailsFormServer(dynamic data) async {
  return GameResult();
}
