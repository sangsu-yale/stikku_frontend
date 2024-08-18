import 'dart:async';
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
  // URL
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/login/oauth/google');

  // 컨트롤러 정리
  final UserController userController = Get.put(UserController());
  final isarController = Get.find<IsarService>();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // 구글 통신 로그인
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();

  // 구글 로그인 통신 성공한 경우
  if (googleAccount != null) {
    final GoogleSignInAuthentication auth = await googleAccount.authentication;
    final String? authorizationCode = auth.accessToken;

    print("서버에게 보낼 액세스 토큰 : $authorizationCode");

    // 토큰 있는 경우
    if (authorizationCode != null) {
      // 서버 로그인 연결 시도
      try {
        // 연결 코드
        final response = await http
            .post(url,
                headers: {"content-type": "application/json; charset=utf-8"},
                body: jsonEncode(
                    <String, String>{'accessToken': authorizationCode}))
            .timeout(const Duration(seconds: 10));

        // 서버 연동 성공 (200)
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

          await prefs.setBool('isLogin', true);

          // TODO: 잘 되는지 확인 동기화 드가자
          await isarController.syncLocalToServer();

          Get.toNamed('/');

          // 서버 연동 실패 (!200)
        } else {
          Get.snackbar(
            "오류",
            "서버에 문제가 있습니다. 빠른 시일 내에 고칠 수 있도록 할게요!",
            snackPosition: SnackPosition.TOP,
          );
          Exception('POST request failed with status: ${response.statusCode}');
        }

        // 타임아웃일 시 (응답없음)
      } on TimeoutException catch (_) {
        // 타임아웃 처리
        Get.snackbar(
          "오류",
          "서버 응답이 지연되고 있습니다. 잠시 후 다시 시도해 주세요.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }

      // 구글 계정 토큰 없는 경우
    } else {
      print("로그인에 실패했습니다.");
    }
    // 구글 계정 진입 실패한 경우
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

// 유저 닉네임 수정
Future<void> updateUsername(int serverId, String username) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users/$serverId');
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
    final String json = jsonEncode(<String, dynamic>{
      'username': username,
      "email": prefs.getString('email'),
      "profile_image": prefs.getString('profile_image')
    });

    try {
      // 서버에 데이터 전송
      final response = await http.put(url, headers: headers, body: json);
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        print('Error: 닉네임 변경 실패: $body');
      }
    } catch (error) {
      // 서버 연결 실패 또는 네트워크 오류 발생
      print('Error: 서버에 연결할 수 없습니다. $error');
    }
  } else {
    print('Error: 유저 정보를 불러오지 못했습니다');
  }
}
