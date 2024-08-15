import 'package:flutter/material.dart';
import 'package:stikku_frontend/utils/services/api_user_service.dart';

class GoogleLoginButton extends StatelessWidget {
  GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: googleLogin,
      child: Container(
        padding: const EdgeInsets.all(13),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: boxDecoration,
        child: Row(
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10),
            const Text(
              "구글 연동하기",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final boxDecoration = BoxDecoration(
      border: Border.all(width: 1, color: Colors.black12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2.0),
          blurRadius: 0,
          spreadRadius: 0,
        ),
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(10));

  void googleLogin() async {
    try {
      login();
    } catch (e) {
      Exception(e);
    }
  }
}
