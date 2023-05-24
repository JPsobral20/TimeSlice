import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto/Screen/SignIn/SignInScreen.dart';

void main() {
  testWidgets('SignIn screen test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: SignInScreen(),
      ),
    );

    expect(find.byKey(Key('emailField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);
    expect(find.byKey(Key('LoginButton')), findsOneWidget);
    expect(find.byKey(Key('SignInButton')), findsOneWidget);
  });
}