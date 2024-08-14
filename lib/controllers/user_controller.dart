import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stikku_frontend/utils/services/isar_service.dart';

class UserController extends GetxController {
  final isarController = Get.find<IsarService>();

  var isLogin = false.obs;
  var userName = '게스트'.obs;
  var userEmail = ''.obs;
  var userUuid = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  // 시작 시 게스트 로그인 확인
  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isUserCreated = prefs.getBool('isUserCreated');
    final bool? isUserLogin = prefs.getBool('isLogin');

    // 없으면 유저 만들고
    if (isUserCreated == null || !isUserCreated) {
      await isarController.addDefaultUser();
      await prefs.setBool('isUserCreated', true);

      isLogin.value = prefs.getBool('isLogin') ?? false;
      userName.value = prefs.getString('username') ?? 'GUEST';
      userEmail.value = prefs.getString('email') ?? '';
      userUuid.value = prefs.getString('uuid') ?? '';

      if (!isLogin.value) {
        // 게스트 초기값 설정
        userName.value =
            '게스트-${userUuid.value == '' ? null : userUuid.value.substring(0, 8).toUpperCase()}';
      }

      // 유저가 있다
    } else {
      // 만약에 로그인 했으면
      if (isUserLogin == true) {
        // 로그인한 상황으로
        isLogin.value = prefs.getBool('isLogin')!;
        userName.value = prefs.getString('username')!;
      } else {
        // 로그인 안 했고, 있으면 유지시켜
        isLogin.value = prefs.getBool('isLogin') ?? false;
        userUuid.value = prefs.getString('uuid') ?? '';
        userName.value =
            '게스트-${userUuid.value == '' ? null : userUuid.value.substring(0, 8).toUpperCase()}';
      }
    }

    await isarController.printAllUsers();
  }

  Future<void> loadUserState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final storageIsLogin = prefs.getBool("isLogin");
    final storageUsername = prefs.getString("username");
    final storageEmail = prefs.getString("email");
    if (storageIsLogin != false) {
      isLogin.value = storageIsLogin!;
      userName.value = storageUsername!;
      userEmail.value = storageEmail!;
    }
  }

  // 로그아웃
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLogin', false);
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('accessToken');

    initialize();
  }

  Future<void> deleteUser() async {
    await isarController.deleteDefaultUser();
    await initialize();
  }
}
