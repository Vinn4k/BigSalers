import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/controller/home_controller.dart';
import 'package:jr_up/app/data/model/item_model.dart';
import 'package:intl/intl.dart';
import 'package:jr_up/shared/themes/text_styles.dart';
import 'package:jr_up/app/widget/popmenubutton_widget.dart';
import 'package:jr_up/app/widget/star_rating_widget.dart';

class ItensWidget extends StatelessWidget {
  const ItensWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return StreamBuilder(
      stream: controller.getAllItems(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasData) {
            return SizedBox(
              width: Get.width,
              height: Get.height,
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.25,
                                height: Get.height * 0.14,
                                child: Image(
                                  image: NetworkImage(
                                    '${snapshot.data?.docs[index].get("filename")}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: Get.width * 0.65,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              "${snapshot.data!.docs[index].get("title")}",
                                              style: TextStyles.titleListTile,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                                "${snapshot.data!.docs[index].get("type")}",
                                                style: TextStyles.titleRegular),
                                          ),
                                          Expanded(
                                            child: popMenuButtonWidget(ItemModel.fromJson(snapshot.data?.docs[index].data())),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            "${snapshot.data!.docs[index].get("rating")}",
                                            style: TextStyles.titleListTile),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                              children: starRatingWidget(
                                                  snapshot.data!.docs[index].get("rating")??
                                                      0)),
                                          Text(
                                            "R\$:${snapshot.data!.docs[index].get("price")}",
                                            style: TextStyles.titleRegular,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),

                                      
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error:${snapshot.error}");
          }

          return const Center(child: CircularProgressIndicator());
        }

    );
  }
}

String dateFormate(date) {
  DateFormat format = DateFormat('dd/MM/yyyy  HH:mm');
  var formate = format.format(date);
  return formate.toString();
}
