import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';


void main() {
  testWidgets('Test PlacesToStudyScreenState', (WidgetTester tester) async {
    // Build the widget tree inside the test case.
    await tester.pumpWidget(
      MaterialApp(
        home: PlacesToStudyScreen(),
      ),
    );

    // Add your test assertions here.
    // For example, you can check if certain widgets are present or if the state behaves as expected.
    expect(find.text('Places to Study'), findsOneWidget);
  });
}

