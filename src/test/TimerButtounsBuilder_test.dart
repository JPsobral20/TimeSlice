import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Widgets/Buttons/Timer/TimerButtonsBuilder.dart';

void main() {
  testWidgets('TimerButtonsBuilder widget test', (WidgetTester tester) async {
    final mockOnPressed = () {};
    final mockBackgroundColor = Colors.red;
    final mockText = 'Press me';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TimerButtonsBuilder(
            onPressed: mockOnPressed,
            backgroundColor: mockBackgroundColor,
            text: mockText,
          ),
        ),
      ),
    );

    final button = find.byType(ElevatedButton);

    expect(button, findsOneWidget);

    final buttonTextFinder = find.text(mockText);
    expect(buttonTextFinder, findsOneWidget);
  });
}
