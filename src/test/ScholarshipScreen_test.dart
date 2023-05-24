import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/Scholarship/ScholarshipScreen.dart';

void main() {
  testWidgets('Settings screen test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: ScholarshipScreen(),
      ),
    );

    expect(find.byKey(Key('CircularPercentIndicator')), findsOneWidget);
  });
}