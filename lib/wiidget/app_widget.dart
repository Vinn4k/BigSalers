
import 'package:flutter/material.dart';
import 'package:jr_up/page/home_page.dart';
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Ovos Verdes e Presunto",
      home: HomePage(),

    );
  }
}
