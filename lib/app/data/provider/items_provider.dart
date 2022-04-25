
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:jr_up/app/data/model/item_model.dart';
import 'package:jr_up/app/interface/iitems.dart';

class ItemsProvider implements IItems {
ItemsProvider({required this.firestore});
  final FirebaseFirestore firestore;

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
  Stream<QuerySnapshot> getIAllItems() async*{


    Stream<QuerySnapshot<Map<String, dynamic>>> data=firestore.collection("products").snapshots();


   yield* data;

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

