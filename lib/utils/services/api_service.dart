import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

// 로그인 (구글)
// Future<Map<String, dynamic>>
void login() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? user = await googleSignIn.signIn();
  print(user);
  if (user != null) {
    final GoogleSignInAuthentication auth = await user.authentication;
    // final String? idToken = auth.idToken; 웹용
    final String? accessToken = auth.accessToken;
    print('액세스 토큰 $accessToken');
  }
  // final url =
  //     Uri.parse('${dotenv.env['SERVER_URL']}/login/oauth2/code/google/login');
  // final response = await http.get(url);
  // if (response.statusCode == 200) {
  //   // 서버가 200을 반환하는 경우, 리다이렉션 URL을 찾기 위해 다른 접근 방식이 필요합니다.
  //   final loginPage = response.body; // 응답 본문에 리다이렉션 URL이 포함된다고 가정합니다.
  //   final location = response.headers;
  //   print(location);
  //   if (loginPage.isNotEmpty) {
  //     // Get.to(const WebViewPage('https://www.google.com'));
  //   } else {
  //     print('로그인 URL을 찾을 수 없습니다.');
  //   }
  // } else {
  //   print('로그인 요청 실패: ${response.statusCode}');
  // }
}

// 로그인 성공시 나오는 코드
// {
// 	"userInfo": {
// 			"id": 1,
// 			"name": "YJ Lee",
// 			"email": "yjlee2450@gmail.com",
// 			"provider": "google",
// 		  "providerId": "116812608231403755191"
// 	},
//   "message": "로그인 성공",
//   "token": "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMTY4MTI2MDgyMzE0MDM3NTUxOTEiLCJuYW1lIjoiWUogTGVlIiwiZW1haWwiOiJ5amxlZTI0NTBAZ21haWwuY29tIiwiaWF0IjoxNzIwODQ0NDk2LCJleHAiOjE3MjA4NDgwOTZ9.JvHYsxwZ2mn1POje2V2SG-BWxih-r7skmlEvP8Y6hFu17mvpa1eJ11EyZAWG_Afir4a6hAu34edQ-ZPmLqNZXQ"
// }

// {
// 	"id": int,
// 	"username": string,
// 	"email": string,
// 	"profileImage": string
// }

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
