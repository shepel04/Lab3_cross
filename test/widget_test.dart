import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab3/main.dart';

void main() {
  testWidgets('Group checkbox states', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    Checkbox box(String text) => tester.widget<Checkbox>(
      find.descendant(
        of: find.widgetWithText(CheckboxListTile, text),
        matching: find.byType(Checkbox),
      ),
    );

    expect(box('Select all').value, false);

    await tester.tap(find.text('Milk'));
    await tester.pump();
    expect(box('Select all').value, null);

    await tester.tap(find.text('Select all'));
    await tester.pump();
    expect(box('Select all').value, true);
    expect(box('Cheese').value, true);

    await tester.tap(find.text('Select all'));
    await tester.pump();
    expect(box('Select all').value, false);
    expect(box('Milk').value, false);
  });
}
