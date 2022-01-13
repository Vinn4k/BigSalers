
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/controller/home_controller.dart';
import 'package:jr_up/data/model/item_model.dart';
import 'package:jr_up/page/edit_iten_page.dart';

import 'alert_widget.dart';
enum itemsMenu{editar,remover}
Widget popMenuButtonWidget( ItemModel data){
  HomeController controller = Get.find<HomeController>();
  return PopupMenuButton<itemsMenu>(itemBuilder: (BuildContext context)=>
  <PopupMenuEntry<itemsMenu>>[
     PopupMenuItem(child: ListTile(
      onTap: (){
        Get.back();
        Get.to(()=> EditItenPage(dataForEdit: data,));
      },
      title: const Text("Editar"),
      leading: const Icon(Icons.edit),
    ),
    value: itemsMenu.editar,),
     PopupMenuItem(child: ListTile(
      onTap: (){
        controller.id.value=data.id!;
        Get.back();

        Get.defaultDialog(
          title: "Alerta!",
          content: const AlertWidget(),
        );
      }  ,
      title: const Text("Remover",style: TextStyle(color: Colors.red),),
      leading: const Icon(Icons.remove, color: Colors.red,),
    ),
      value: itemsMenu.remover,),

  ],);
}
