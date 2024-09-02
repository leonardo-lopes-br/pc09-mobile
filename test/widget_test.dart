import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pc09_dmovel/main_app.dart';

void main() {
  testWidgets('Score increment smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our score starts at 0.
    expect(find.text('0'), findsWidgets);
    expect(find.text('1'), findsNothing);

    // Tap the score increment button and trigger a frame.
    await tester.tap(find.text('Single Point'));
    await tester.pump();

    // Verify that our score has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsWidgets);
  });
}
