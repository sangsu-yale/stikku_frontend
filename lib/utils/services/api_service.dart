import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
    print("토큰 반환");
    print(authorizationCode);
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

        await prefs.setString('accessToken', serverAccessToken);

        // 유저 정보 받아오기(serverID)
        final userInfo = await fetchUser(serverAccessToken);
        final userInfo2 = await fetchUserID(4, serverAccessToken);

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
  print(url);
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

// {
//   "id": int,
// 	"username": "string",
// 	"email": "email",
// 	"profile_image": "프로필 이미지 URL"
// }

Future<Map<String, dynamic>> getGameResult() async {
  final url = Uri.parse(
      'https://ecd9b3e1-ec73-4c3e-99fb-121908179e18.mock.pstmn.io/questions/2');
  // final url = Uri.parse('${dotenv.env['SERVER_URL']}/game/$gameResultId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('티켓 정보 없음');
  }
}
