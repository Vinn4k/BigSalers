import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/controller/home_controller.dart';
import 'package:jr_up/app/data/model/item_model.dart';

import 'package:jr_up/shared/themes/app_colors.dart';
import 'package:jr_up/app/widget/itens_widget.dart';

import 'edit_iten_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String defaultUrl="https://firebasestorage.googleapis.com/v0/b/allianks-4110a.appspot.com/o/images%2Fconf%2Fno-image.png?alt=media&token=d93c31ed-550e-4e93-92db-2967210e1efa";
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Home"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            ItemModel model = ItemModel();
            model.price=0.0;
            model.height=320;
            model.width=320;
            model.rating=0;
            model.filename=defaultUrl;
            Get.to(EditItenPage(
              dataForEdit: model,isForEdit: false,
            ));
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Minha conta"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.textOnSecondary,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favoritos"),
          ],
        ),
        body: const ItensWidget());
  }
}
