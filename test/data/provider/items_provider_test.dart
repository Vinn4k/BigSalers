import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr_up/app/data/model/item_model.dart';
import 'package:jr_up/app/data/provider/items_provider.dart';

import '../../mock/fake_firebase_mock.dart';

void main(){

  group("Items Provider Teste", (){
    FakeFirebaseFirestore firestore=FakeFirebaseFirestore();
     FakeFirebaseMock().mockItems();
    final ItemsProvider _provider=ItemsProvider(firestore: firestore);

print(firestore.collection("products").snapshots().first
);

    test("GetAll", ()async{
      List<ItemModel> data=await _provider.getIAllItems();
    });

  });



}