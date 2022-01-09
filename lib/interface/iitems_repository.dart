import 'package:jr_up/data/model/item_model.dart';

abstract class ItemsRepositoryInterface{
  Future<List<ItemModel>>getIAlltems();
  Future<ItemModel> updateItem(ItemModel data,String id);
  Future<ItemModel> createItem(ItemModel data);
  Future<ItemModel> deleteItem(String documentId);

}