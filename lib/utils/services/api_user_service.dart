import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/controllers/user_controller.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

// 로그인 (구글)
void login() async {
  final UserController userController = Get.put(UserController());
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
        // "accessToken" 값을 받아옴
        final body = jsonDecode(response.body) as Map<String, dynamic>;

        final String serverAccessToken = body["accessToken"];
        await prefs.setString('accessToken', serverAccessToken);

        // 유저 정보 받아오기(serverID)
        final userInfo = await fetchUser(serverAccessToken);

        // user 업데이트 (유저 업데이트 및 유저 생성은 똑같다)
        isarController.updateUser(userInfo["id"], userInfo["username"],
            userInfo["email"], userInfo["profileImage"]);

        // prefs 업데이트 해 주고 (유저 이름과 이메일만 필요)
        await prefs.setString('username', userInfo["username"]);
        await prefs.setString('email', userInfo["email"]);
        await prefs.setBool('isLogin', true);
        userController.loadUserState();
        // 아닐 시
      } else {
        Exception('POST request failed with status: ${response.statusCode}');
      }
    }

    await prefs.setBool('isLogin', true);
    Get.toNamed('/');

    // 구글 로그인 실패한 경우
  } else {
    print("로그인에 실패했습니다.");
  }
}

// 유저 정보 불러오기 (처음)
Future<Map<String, dynamic>> fetchUser(String accessToken) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users');
  final response =
      await http.get(url, headers: {'Authorization': "Bearer $accessToken"});

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('유저 정보를 불러오지 못했습니다');
  }
}

// 유저 정보 불러오기 (유저 아이디 판별)
Future<Map<String, dynamic>> fetchUserID(
    int serverId, String serverAccessToken) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users/$serverId');
  final response = await http
      .get(url, headers: {'Authorization': "Bearer $serverAccessToken"});

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('유저 정보를 불러오지 못했습니다');
  }
}

// 유저 삭제
Future<Map<String, dynamic>> deleteUser(
    int serverId, String accessToken) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users/$serverId');
  final response =
      await http.delete(url, headers: {'Authorization': "Bearer $accessToken"});

  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('유저 정보를 불러오지 못했습니다');
  }
}
