
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jr_up/data/model/item_model.dart';
///controla o upload de arquivos
class AssetsUploadController extends GetxController{
  RxBool loading=false.obs;






  ///envia os assets  para o firebase;
  Future<void> sendAssetsToFirebase() async {
    loading.value=true;
    final String localJson =
    await rootBundle.loadString('assets/products.json');
    final List<dynamic> dataLocal = await jsonDecode(localJson);
    final data = dataLocal.map((resp) => ItemModel.fromJson(resp)).toList();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseStorage task = FirebaseStorage.instance;
    for (var item in data) {
      File file = await getImageFileFromAssets('${item.filename}');
      int name=DateTime.now().microsecondsSinceEpoch;
      ///envia a imagem para o firebase
      await task
          .ref()
          .child('images/itens/${name.toString()}')
          .putFile(file);
      ///seta a url do arquivo
      String downloadURL = await task
          .ref('images/itens/${name.toString()}')
          .getDownloadURL();

      ///envia os products para o fireStore
      await firestore.collection("products").doc().set({
        "title": item.title,
        "type": item.type,
        "description": item.description,
        "filename": downloadURL,
        "height": item.height,
        "width": item.width,
        "price": item.price,
        "rating": item.rating,
        "created": FieldValue.serverTimestamp()
      });
    }
    loading.value=false;

  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/images/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}