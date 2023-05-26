import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:projeto/Screen/Shop/ShopScreen.dart';

void main() {

  group('ShopScreen widget test', () {

    testWidgets('test if app title is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ShopScreen()));
      final titleFinder = find.text('Shop');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Test PlacesToStudyScreenState', (WidgetTester tester) async {
      // Build the widget tree inside the test case.
      await tester.pumpWidget(
        MaterialApp(
          home: ShopScreen(),
        ),
      );

      expect(find.byKey(Key("AppTitle")), findsOneWidget);
    });


  });

}

