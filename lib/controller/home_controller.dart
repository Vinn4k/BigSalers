
import 'dart:io';

import 'package:get/get.dart';
import 'package:jr_up/data/model/item_model.dart';
import 'package:jr_up/data/provider/items_provider.dart';
import 'package:jr_up/interface/iitems_repository.dart';

class HomeController extends GetxController with StateMixin<List<HomeController>> {
  RxBool loading = false.obs;
  RxString id="".obs;


  late final IItemsProvider _interface;

  @override
  void onInit() async {
    super.onInit();
    _interface = ItemsProvider();
    getAllItems();


  }

  Future<List<ItemModel>> getAllItems() async {
    change([],status: RxStatus.loading());
    List<ItemModel> data=await _interface.getIAlltems();
    change([],status: RxStatus.success());
    loading.value=false;
    return data;

  }

    Future<void> updateIten(ItemModel data,String documentId, {File? file})async{

    loading.value=true;
   await _interface.updateData(documentId, data);
    loading.value=false;

    Get.back();
    }
  Future<void> delete(String id)async {
  loading.value=true;
    _interface.deleteItem(id);
  loading.value=false;

  }

}
