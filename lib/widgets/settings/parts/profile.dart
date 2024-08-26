part of '../../../pages/settings_page.dart';

class _Profile extends StatelessWidget {
  const _Profile({
    required this.userController,
  });

  final UserController userController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_4_rounded, size: 50, color: Colors.blue),
          const SizedBox(width: 10),
          Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${userController.userName} 님",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userController.isLogin.value
                        ? "반가워요!"
                        : "로그인 기능을 기대해 주세요!", // TODO: 로그인 기능 추가시 바꿀 것
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     if (userController.isLogin.value) {
                  //       userController.logout();
                  //     } else {
                  //       Get.toNamed('/login');
                  //     }
                  //   },
                  //   child: userController.isLogin.value
                  //       ? const Text("로그아웃")
                  //       : const Text("가입/로그인하기"),
                  // ),
                ],
              )),
        ],
      ),
    );
  }
}
