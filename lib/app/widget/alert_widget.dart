import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:jr_up/app/controller/home_controller.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Column(
      children: [
        Obx(() {
          return controller.loading.value ?
          const CircularProgressIndicator() : const Text(
              "Deseja continuar a Remoção?");
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: () async{
             await controller.delete(controller.id.value);
             Get.back();


            }, child: const Text("Sim", style: TextStyle(
                color: Colors.red
            ),)),
            TextButton(onPressed: () {
            }, child: const Text("Não", style: TextStyle(
                color: Colors.green
            ),)),

          ],
        )

      ],
    );
  }
}
