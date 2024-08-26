part of '../../../pages/login_page.dart';

class _LoginContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              GoogleLoginButton(),
            ],
          )),
    );
  }
}
