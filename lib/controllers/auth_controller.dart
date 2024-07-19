import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Dio _dio = Dio();
  var user = Rx<GoogleSignInAccount?>(null);
  var token = ''.obs;

  Future<void> signInWithGoogle() async {
    try {
      // 구글 로그인 시도
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        user.value = googleUser;
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // 서버로 구글 로그인 요청
        final response = await _dio
            .get('https://your-server.com/login/oauth2/code/google/login');
        if (response.statusCode == 302) {
          // 서버에서 제공하는 리다이렉션 URL 추출
          final redirectUrl = response.headers['location']?.first;
          if (redirectUrl != null) {
            // 구글 인증 후 서버로 콜백 요청
            final callbackResponse =
                await _dio.get(redirectUrl, queryParameters: {
              'code': googleAuth.serverAuthCode,
            });

            if (callbackResponse.statusCode == 200 ||
                callbackResponse.statusCode == 201) {
              final body = callbackResponse.data;
              token.value = body['token'];
              print('로그인 성공: ${token.value}');
              Get.offNamed('/home');
            } else {
              Get.snackbar('Error', '인증에 실패했습니다.');
            }
          }
        } else if (response.statusCode == 403) {
          Get.snackbar('Error', response.data['message']);
        }
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    user.value = null;
    token.value = '';
  }
}
