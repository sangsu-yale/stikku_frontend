import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ✅ 게임Result 포스트
Future<Map<String, dynamic>> postGameResult(Map data) async {
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
    final String json = jsonEncode(<String, dynamic>{
      'gameResult': data["gameResult"],
      'gameReview': data["gameReview"]
    });

    try {
      // 서버에 데이터 전송
      final response = await http.post(url, headers: headers, body: json);
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 201) {
        final serverGameResultID = body["gameResult"]["id"];
        final serverGameReviewID = body["gameReview"]["id"];
        return {
          "serverGameResultID": serverGameResultID,
          "serverGameReviewID": serverGameReviewID
        };
      } else {
        // 서버 응답이 있지만 오류 발생
        print('Error: 게임 결과 저장 실패: $body');
        return {}; // 빈 맵 반환
      }
    } catch (error) {
      // 서버 연결 실패 또는 네트워크 오류 발생
      print('Error: 서버에 연결할 수 없습니다. $error');
      return {}; // 빈 맵 반환
    }
  } else {
    print('Error: 유저 정보를 불러오지 못했습니다');
    return {}; // 빈 맵 반환
  }
}

// ✅ 게임Result 업데이트
void updateGameResult(int id, Map data) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/games/$id');
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
      'gameResult': data["gameResult"],
      'gameReview': data["gameReview"]
    });
    try {
      // 서버에 PUT 요청
      final response = await http.put(url, headers: headers, body: json);
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200) {
        print("성공적으로 반영되었습니다.");
        print(body);
      } else {
        print('Error: 게임 결과 업데이트 실패: $body');
      }
    } catch (error) {
      print('Error: 서버에 연결할 수 없습니다. $error');
    }
  } else {
    print('Error: 유저 정보를 불러오지 못했습니다');
  }
}

// ✅ 게임 Result 삭제
void deleteGameResult(int id) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/games/$id');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('accessToken');

  // 액세스 토큰 있으면
  if (accessToken != null) {
    // 액세스 토큰 헤더에 넣어 줘야 해
    final Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
      "Authorization": "Bearer $accessToken"
    };

    try {
      // 서버에 DELETE 요청
      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        print("성공적으로 삭제되었습니다.");
      } else {
        // 서버 응답 오류
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        print('Error: 게임 결과 삭제 실패: $body');
      }
    } catch (error) {
      // 서버 연결 실패 또는 네트워크 오류 발생
      print('Error: 서버에 연결할 수 없습니다. $error');
    }
  } else {
    print('Error: 유저 정보를 불러오지 못했습니다');
  }
}

// ✅ 게임 좋아요
void putGameFavorite(int id, bool isFavorite) async {
  final url = Uri.parse('${dotenv.env['SERVER_URL']}/games/$id/favorite');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? accessToken = prefs.getString('accessToken');
  // 액세스 토큰 있으면
  if (accessToken != null) {
    // 액세스 토큰 헤더에 넣어 줘야 해
    final Map<String, String> headers = {
      "content-type": "application/json; charset=utf-8",
      "Authorization": "Bearer $accessToken"
    };

    // isFavorite true
    // 바디값 넣어 줘야 함
    final String json = jsonEncode(<dynamic, dynamic>{
      'isFavorite': !isFavorite,
    });

    try {
      final response = await http.put(url, headers: headers, body: json);

      if (response.statusCode != 204) {
        // 서버가 성공적인 응답을 반환하지 않은 경우
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        print('Error: 좋아요 반영 실패: $body');
      } else {
        print('성공적으로 좋아요 상태가 반영되었습니다.');
      }
    } catch (error) {
      // 네트워크 오류 또는 서버 연결 실패 시
      print('Error: 서버에 연결할 수 없습니다. $error');
    }
  } else {
    print('Error: 유저 정보를 불러오지 못했습니다');
  }
}
