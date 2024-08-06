import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// 로그인 (구글)
// Future<Map<String, dynamic>>
void login() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );
  final GoogleSignInAccount? user = await googleSignIn.signIn();
  if (user != null) {
    print(user);
    final GoogleSignInAuthentication auth = await user.authentication;
    // final String? idToken = auth.idToken; 웹용

    final String? accessToken = auth.accessToken;
    print('액세스 토큰 $accessToken');

    // 서버와 통신
    // user 정보를 isar에 저장

    Get.toNamed('/');
  }
}

// 유저 정보 불러오기
Future<Map<String, dynamic>> fetchUser(int userId) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/users/$userId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
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

Future<Map<String, dynamic>> getGameResult(String gameResultId) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/game/$gameResultId');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception('티켓 정보 없음');
  }
}
