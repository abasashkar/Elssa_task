import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elssa_task/main.dart';

void main() {
  testWidgets('App launches splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ElssaApp());
    await tester.pump();
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Powered by Oyelabs'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
}
