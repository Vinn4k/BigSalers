
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:jr_up/data/model/item_model.dart';
import 'package:jr_up/interface/iitems_repository.dart';

class ItemsProvider implements IItemsProvider {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage task = FirebaseStorage.instance;

  @override
  Future<ItemModel> createItem(ItemModel data) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String documentId) async {
    await firestore.collection("products").doc(documentId).delete();
  }

  @override
  Future<List<ItemModel>> getIAlltems() async {
    try{
    QuerySnapshot data = await firestore.collection("products").get();
    return data.docs.map((item) => ItemModel.fromJson(item)).toList();}
    catch(e){

      throw Exception("Erro ao obter items");
    }
  }



  @override
  Future<ItemModel> getItemById(String documentId)async {
    DocumentSnapshot data = await firestore.collection("products").
    doc(documentId).get();
    return itemModelFromJson(data.toString());  }

  @override
  Future<void> updateData(String documentId,ItemModel item,)async {

    try{
      var db=firestore.collection("products").doc(documentId);
      await db.update({
        "title": item.title,
        "type": item.type,
        "description": item.description,
        "filename": item.filename,
        "height": item.height,
        "width": item.width,
        "price": item.price,
        "rating": item.rating,
      });
    }catch(e){
    }
    }
    }

