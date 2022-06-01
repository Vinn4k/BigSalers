import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jr_up/app/page/edit_iten_page.dart';

import '../binding/home_binding.dart';
import '../page/home_page.dart';
import '../page/login_page.dart';
import 'app_routes.dart';

class AppPages{
  static final routes = [
    GetPage(name: Routes.INITIAL, page:()=> const HomePage(),
      binding: HomeBinding(),

    ),
    GetPage(name: Routes.LOGIN, page: ()=> const LoginPage()),
  ];
}