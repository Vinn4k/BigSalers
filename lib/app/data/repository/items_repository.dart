
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jr_up/app/data/model/item_model.dart';
import 'package:jr_up/app/data/provider/items_provider.dart';
import 'package:jr_up/app/interface/iitems.dart';

class ItemsRepository implements IItems{
  ItemsRepository(this.firestore );
  final FirebaseFirestore firestore;

  final ItemsProvider _provider=ItemsProvider(firestore: FirebaseFirestore.instance);

  @override
  Future<ItemModel> createItem(ItemModel data) {

    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String documentId) async {
    _provider.deleteItem(documentId);
  }



  @override
  Future<ItemModel> getItemById(String documentId) {
    // TODO: implement getItemById
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(String documentId, ItemModel item) {
    return   _provider.updateData(documentId,item);
  }

  @override
  Stream<QuerySnapshot> getIAllItems()async* {
    yield* _provider.getIAllItems();

  }
}