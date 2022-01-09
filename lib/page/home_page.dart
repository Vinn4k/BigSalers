import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:jr_up/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put((HomeController()));

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Início")),
      ),
      drawer: const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Row(
              children: [
                Container(
                  width: Get.width * 0.3,
                  height: Get.height * 0.15,
                  child: Image(image: AssetImage("assets/images/0.jpg"),),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: Get.width * 0.65,
                        height: Get.height * 0.04,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Expanded(
                              flex: 0,
                              child: Text("Sweet dsfsdfsdfsdfsfsdfda"),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text("Bolo"),
                            ),
                            Obx(() {
                              return Expanded(
                                child: controller.loading.value ?
                                CircularProgressIndicator():
                                IconButton(

                                  onPressed: () async {
                                    controller.sendJsonToFirebase();
                                  },
                                  icon: const Icon(Icons.more_horiz),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                      const Text("4"),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(Icons.star, color: Colors.amber[500]),
                            ),
                            const Expanded(child: Text("R\$:50"),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
