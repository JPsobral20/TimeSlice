import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyItems.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyRooms.dart';
import 'package:projeto/Screen/PlacesToStudy/PlacesToStudyScreen.dart';
import 'package:projeto/Widgets/AppTitle.dart';


void main() {
  testWidgets('PlacesToStudyScreen should build successfully', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PlacesToStudyScreen()));
    expect(find.byType(Scaffold), findsOneWidget);
  });

  testWidgets('PlacesToStudyScreen should have the correct gradient colors', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PlacesToStudyScreen()));
    final container = find.byType(Container).evaluate().first.widget as Container;
    final decoration = container.decoration as BoxDecoration;
    final gradient = decoration.gradient as LinearGradient;
    expect(gradient.colors, [
      Color(0xffffc58d),
      Color(0xccffc58d),
      Color(0x99ffc58d),
      Color(0x66ffc58d),
      Color(0x33ffc58d),
    ]);
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

