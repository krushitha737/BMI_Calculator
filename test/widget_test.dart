
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('BMI Calculator app test', (WidgetTester tester) async {
    // Launch application
    await tester.pumpWidget(const BMICalculatorApp());

    // Check home screen
    expect(find.text('BMI Calculator'), findsOneWidget);
    expect(find.text('HEALTH TRACKER'), findsOneWidget);
    expect(find.text('Select Gender'), findsOneWidget);
    expect(find.text('Your Height'), findsOneWidget);
    expect(find.text('Your Measurements'), findsOneWidget);

    // Check gender options
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);

    // Scroll to Calculate BMI button
    final calculateButton = find.text('CALCULATE BMI');

    await tester.ensureVisible(calculateButton);
    await tester.pumpAndSettle();

    // Tap Calculate BMI
    await tester.tap(calculateButton);
    await tester.pumpAndSettle();

    // Check result screen
    expect(find.text('Your BMI Report'), findsOneWidget);
    expect(find.text('22.5'), findsOneWidget);
    expect(find.text('Normal Weight'), findsOneWidget);

    // Scroll to Recalculate button
    final recalculateButton = find.text('RECALCULATE BMI');

    await tester.ensureVisible(recalculateButton);
    await tester.pumpAndSettle();

    // Tap Recalculate
    await tester.tap(recalculateButton);
    await tester.pumpAndSettle();

    // Verify home screen
    expect(find.text('BMI Calculator'), findsOneWidget);
    expect(find.text('Your Height'), findsOneWidget);
  });
}
