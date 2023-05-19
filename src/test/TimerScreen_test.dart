import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/Timer/TimerScreen.dart';



void main() {
  testWidgets('TimerScreen start and stop', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TimerScreen()));

    // Verify that the timer starts at 0.
    expect(find.text('00:00'), findsOneWidget);

    // Press the Start button.
    await tester.tap(find.text('Start Studing'));
    await tester.pump();

    // Verify that the timer starts counting down.
    expect(find.text('00:00'), findsNothing);
    expect(find.text('00:01'), findsOneWidget);

    // Wait for 1 second.
    await tester.pump(Duration(seconds: 1));

    // Verify that the timer is still counting down.
    expect(find.text('00:00'), findsNothing);
    expect(find.text('00:00'), findsNothing);
    expect(find.text('00:01'), findsNothing);
    expect(find.text('00:59'), findsOneWidget);

    // Press the Pause button.
    await tester.tap(find.text('Pause'));
    await tester.pump();

    // Verify that the timer stops counting down.
    expect(find.text('00:59'), findsOneWidget);

    // Press the Resume button.
    await tester.tap(find.text('Resume'));
    await tester.pump();

    // Verify that the timer resumes counting down.
    expect(find.text('00:58'), findsOneWidget);

    // Wait for the timer to reach 0.
    await tester.pump(Duration(seconds: 58));

    // Verify that the timer stops at 0.
    expect(find.text('00:00'), findsOneWidget);
    expect(find.text('00:01'), findsNothing);

    // Verify that the iscompleted method returns true.
    TimerScreenState state = tester.state(find.byType(TimerScreen));
    expect(state.isCompleted(), isTrue);
  });
}
