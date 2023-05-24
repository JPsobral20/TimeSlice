import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';
import 'package:projeto/Widgets/AppTitle.dart';

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


/*
void main() {
  testWidgets('PlacesToStudyScreen should build successfully', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PlacesToStudyScreen()));
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('PlacesToStudyScreen should have the correct gradient colors', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PlacesToStudyScreen()));
    final container = find.byType(Container).evaluate().first.widget as Container;
    final color = container.color as BoxDecoration;
    expect(color, Color(0xfff3e5f5));
  });

  testWidgets('PlacesToStudyScreen should have the correct title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PlacesToStudyScreen()));
    expect(find.text('Places to Study'), findsOneWidget);
    final title = find.text('Places to Study').evaluate().first.widget as Text;
    expect(title.style!.color, Colors.white);
    expect(title.style!.fontWeight, FontWeight.bold);
    expect(title.style!.fontSize, 38);
  });


  testWidgets('PlacesToStudyScreen should display the AppTitle widget in the top right corner', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PlacesToStudyScreen()));
    expect(find.byType(AppTitle), findsOneWidget);
    final appTitle = find.byType(AppTitle).evaluate().first.widget as AppTitle;
    expect(appTitle.size, 42);
  });
}
 */

