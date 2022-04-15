
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/binding/home_binding.dart';
import 'package:jr_up/app/page/home_page.dart';
import 'package:jr_up/app/page/login_page.dart';
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: "Ovos Verdes e Presunto",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page:()=> const HomePage(),
          binding: HomeBinding(),

        ),
        GetPage(name: "/login", page: ()=> const LoginPage())
      ],

    );
  }
}
