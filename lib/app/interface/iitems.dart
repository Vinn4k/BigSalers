
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jr_up/app/data/model/item_model.dart';

abstract class IItems{
  Stream<QuerySnapshot>getIAllItems();
  Future<ItemModel> createItem(ItemModel data);
  Future<void> deleteItem(String documentId);
  Future<ItemModel> getItemById(String documentId);
  Future <void> updateData(String documentId,ItemModel item);

}