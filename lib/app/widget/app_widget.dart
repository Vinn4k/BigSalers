
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/page/home_page.dart';
import 'package:jr_up/app/routes/app_pages.dart';
import '../routes/app_routes.dart';
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: "Ovos Verdes e Presunto",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,


    );
  }
}
