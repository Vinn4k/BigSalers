
import 'package:get/get.dart';
import 'package:jr_up/data/model/item_model.dart';
import 'package:jr_up/data/repository/items_repository.dart';
import 'package:jr_up/interface/iitems_repository.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  late final ItemsRepositoryInterface _interface;

  @override
  void onInit() async {
    super.onInit();
    _interface = ItemsRepository();
  }

  Future<List<ItemModel>> getAllItems() async {
    return await _interface.getIAlltems();
  }


}
