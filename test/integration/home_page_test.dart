import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect/http/src/http/mock/http_request_mock.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jr_up/widget/app_widget.dart';

class MockFirebaseStorage extends MockClient implements FirebaseStorage{}
void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(()async{
    await Firebase.initializeApp();
  });
  testWidgets(
    "Teste Botão",
    (WidgetTester tester) async {
      await tester.pumpWidget(const AppWidget());
      await tester.tap(find.byType(PopupMenuButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.remove));
    },
  );
}
