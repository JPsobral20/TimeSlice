import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Widgets/Buttons/Timer/TimerButtonsBuilder.dart';

void main() {
  testWidgets('TimerButtonsBuilder properties', (WidgetTester tester) async {
    // Define test variables
    final void Function() onPressed = () => print('Button pressed!');
    final String text = "Start Studing";

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: TimerButtonsBuilder(
          onPressed: onPressed,
          backgroundColor: Colors.blue,
          text: text,
        ),
      ),
    );

    // Verify that the widget's properties are set correctly
    final buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);

    /*
    final buttonWidget = tester.widget<ElevatedButton>(buttonFinder);
    expect(buttonWidget.style?.backgroundColor, Colors.blue);
    */

    final textFinder = find.text(text);
    expect(textFinder, findsOneWidget);
  });
}
