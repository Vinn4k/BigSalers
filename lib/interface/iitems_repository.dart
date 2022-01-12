
import 'package:jr_up/data/model/item_model.dart';

abstract class IItemsProvider{
  Future<List<ItemModel>>getIAlltems();
  Future<ItemModel> createItem(ItemModel data);
  Future<void> deleteItem(String documentId);
  Future<ItemModel> getItemById(String documentId);
  Future <void> updateData(String documentId,ItemModel item);

}