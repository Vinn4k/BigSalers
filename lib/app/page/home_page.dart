import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/controller/home_controller.dart';

import 'package:jr_up/shared/themes/app_colors.dart';
import 'package:jr_up/app/widget/itens_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Home"),

          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
          controller.sendAssetsToFirebase();
        },),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items:  const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Minha conta"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,color: AppColors.textOnSecondary,), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favoritos"),
          ],
        ),
        body:
           const ItensWidget()

    );
  }
}

