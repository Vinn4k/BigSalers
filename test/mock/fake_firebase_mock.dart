import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

class FakeFirebaseMock{
  FakeFirebaseFirestore firebase=FakeFirebaseFirestore();
  
  
  Future<void> mockItems()async{
    firebase.collection("products").doc("teste").set(
      {
        "title": "teste1",
        "description": "Teste1"

      }
    );
    print(firebase.collection("products").doc("teste").get());
  }
  
  
}