import 'package:get/get.dart';
import 'package:stikku_frontend/config/bindings.dart';
import 'package:stikku_frontend/pages/home_page.dart';
import 'package:stikku_frontend/pages/main/main_screen.dart';
import 'package:stikku_frontend/pages/details_page.dart';
import 'package:stikku_frontend/pages/login_page.dart';
import 'package:stikku_frontend/pages/write_page.dart';

// 상수로 정의
final List<GetPage> appRoutes = [
  GetPage(
    name: '/',
    page: () => MainScreen(),
  ),
  GetPage(
    name: '/home',
    page: () => HomePage(),
  ),
  GetPage(
    name: '/write',
    page: () => WritePage(),
    transition: Transition.cupertino,
    binding: WriteBindings(),
  ),
  GetPage(
    name: '/details',
    page: () => DetailsPage(),
    transition: Transition.native,
    binding: DetailsBindings(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.rightToLeft,
  ),
];
