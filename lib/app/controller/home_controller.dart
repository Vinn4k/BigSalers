import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/data/model/item_model.dart';
import 'package:jr_up/app/data/provider/items_provider.dart';
import 'package:jr_up/app/data/repository/items_repository.dart';
import 'package:jr_up/app/interface/iitems.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController with StateMixin<List<HomeController>> {
  RxBool loading = false.obs;
  RxString id="".obs;


  late final ItemsRepository _repository;

  @override
  void onInit() async {
    _repository = ItemsRepository(FirebaseFirestore.instance);
    super.onInit();


  }

  Stream<QuerySnapshot> getAllItems() async* {

    yield*  _repository.getIAllItems();


  }

    Future<void> updateItem(ItemModel data,String documentId, {File? file})async{

    loading.value=true;
   await _repository.updateData(documentId, data);
    loading.value=false;

    Get.back();
    }
  Future<void> delete(String id)async {
  loading.value=true;
  _repository.deleteItem(id);
  loading.value=false;

  }
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
          .child('images/itens/${name.toString()}.jpg')
          .putFile(file);
      ///seta a url do arquivo
      String downloadURL = await task
          .ref('images/itens/${name.toString()}.jpg')
          .getDownloadURL();

      ///envia os products para o fireStore
      var db=firestore.collection("products").doc();
      await db.set({
        "title": item.title,
        "type": item.type,
        "description": item.description,
        "filename": downloadURL,
        "height": item.height,
        "width": item.width,
        "price": item.price,
        "rating": item.rating,
        "id":db.id,
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
