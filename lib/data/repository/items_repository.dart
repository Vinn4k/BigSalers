import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jr_up/data/model/item_model.dart';
import 'package:jr_up/interface/iitems_repository.dart';

class ItemsRepository implements ItemsRepositoryInterface {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage task = FirebaseStorage.instance;

  @override
  Future<ItemModel> createItem(ItemModel data) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<ItemModel> deleteItem(String documentId) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ItemModel>> getIAlltems() async {
    try{
    QuerySnapshot data = await firestore.collection("products").get();
    return data.docs.map((item) => ItemModel.fromJson(item)).toList();}
    catch(e){
      print(e);

      throw Exception("Erro ao obter items");
    }
  }

  @override
  Future<ItemModel> updateItem(ItemModel data, String id) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
