
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jr_up/main.dart' as app;





void main()async{
   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Home Teste", (){

    testWidgets("Teste de listagem de items", (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.byType(Card), findsNWidgets(5));
      expect(find.byTooltip("menu").first, findsOneWidget);
      await tester.tap(find.byTooltip("menu").first);
      await tester.pump(const Duration(seconds: 4));
      expect(find.text("Editar"), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.text("Remover"));
      await tester.pump(const Duration(seconds: 2));
      await tester.tap(find.text("Não"));
      await tester.pump(const Duration(seconds: 2));


    });

  });
}

// testWidgets("Teste da Home", (WidgetTester tester) async {
// app.main();
//
// await tester.pump(const Duration(seconds: 4));
//
// expect(find.text("Remover"), findsOneWidget);
// await tester.tap(find.text("Remover"));
// await tester.pump(const Duration(seconds: 4));
//
//
//
// });