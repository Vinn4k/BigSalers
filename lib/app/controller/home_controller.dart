import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/data/model/item_model.dart';
import 'package:jr_up/app/data/provider/items_provider.dart';
import 'package:jr_up/app/data/repository/items_repository.dart';
import 'package:jr_up/app/interface/iitems.dart';

class HomeController extends GetxController with StateMixin<List<HomeController>> {
  RxBool loading = false.obs;
  RxString id="".obs;


  late final ItemsRepository _repository;

  @override
  void onInit() async {
    _repository = ItemsRepository(FirebaseFirestore.instance);
    super.onInit();


  }

  Future<List<ItemModel>> getAllItems() async {
    change([],status: RxStatus.loading());
    List<ItemModel> data=await _repository.getIAllItems();
    change([],status: RxStatus.success());
    loading.value=false;
    return data;

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

}
