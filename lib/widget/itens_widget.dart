import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/controller/home_controller.dart';
import 'package:jr_up/data/model/item_model.dart';
import 'package:intl/intl.dart';
import 'package:jr_up/shared/themes/text_styles.dart';
import 'package:jr_up/widget/popmenubutton_widget.dart';
import 'package:jr_up/widget/star_rating_widget.dart';

class ItensWidget extends StatelessWidget {
  const ItensWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return FutureBuilder(
      future: controller.getAllItems(),
      builder: (BuildContext context, AsyncSnapshot<List<ItemModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SizedBox(
              width: Get.width,
              height: Get.height,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
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
                                    '${snapshot.data![index].filename}',
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
                                              "${snapshot.data![index].title}",
                                              style: TextStyles.titleListTile,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                                "${snapshot.data![index].type}",
                                                style: TextStyles.titleRegular),
                                          ),
                                          Expanded(
                                            child: popMenuButtonWidget(snapshot.data![index]),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            "${snapshot.data![index].rating}",
                                            style: TextStyles.titleListTile),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                              children: starRatingWidget(
                                                  snapshot.data![index]
                                                          .rating ??
                                                      0)),
                                          Text(
                                            "R\$:${snapshot.data![index].price}",
                                            style: TextStyles.titleRegular,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Criado em: ${dateFormate(
                                            snapshot.data![index].created
                                                ?.toDate(),
                                          )}",
                                        ),
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
            return Container(child: Text("Error"),);
          }
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

String dateFormate(date) {
  DateFormat format = DateFormat('dd/MM/yyyy  HH:mm');
  var formate = format.format(date);
  return formate.toString();
}
