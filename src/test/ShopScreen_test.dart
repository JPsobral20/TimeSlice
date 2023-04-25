import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Screen/Shop/ShopItems.dart';
import 'package:projeto/Screen/Shop/ShopScreen.dart';
import 'package:projeto/Screen/Shop/Box/CategoriesBox.dart';

void main() {

  group('ShopScreen widget test', () {

    testWidgets('test if app title is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ShopScreen()));
      final titleFinder = find.text('Shop');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('test if categories box is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ShopScreen()));
      final categoriesFinder = find.byType(CategoriesBox);
      expect(categoriesFinder, findsOneWidget);
    });

    testWidgets('test if shop items are displayed', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ShopScreen()));
      final shopItemsFinder = find.byType(ShopItems);
      expect(shopItemsFinder, findsWidgets);
    });

  });

}
