import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: Get.height * 0.25,
            ),
            Center(
              child: Container(
                width: Get.width * 0.4,
                height: Get.height * 0.17,
                color: Colors.red,
              ),
            ),
            Center(
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.06,
                color: Colors.blue,
              ),
            ),
            Center(
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.06,
                color: Colors.green,
              ),
            ),
            Center(
              child: Container(
                width: Get.width * 0.3,
                height: Get.height * 0.06,
                color: Colors.green,
              ),
            ),
            Center(
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.06,
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * 0.04,
                      height: Get.height * 0.06,
                      child: Icon(Icons.group_work_rounded),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: Get.width,
                      ),
                    ),
                    Text("Login com o Google"),
                    Expanded(
                      child: SizedBox(
                        width: Get.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width * 0.8,
                height: Get.height * 0.06,
                color: Colors.lightBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.04,
                      height: Get.height * 0.06,
                      child: const Icon(Icons.face),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: Get.width,
                      ),
                    ),
                    const Text("Login com o Facebook"),
                    Expanded(
                      child: SizedBox(
                        width: Get.width,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(
              child: Text("Lorem Lorem"),
            )
          ],
        ),
      ),
    );
  }
}
