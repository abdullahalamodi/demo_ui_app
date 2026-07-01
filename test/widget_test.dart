import 'package:demo_ui_app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App starts with guide foundation screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.text('Demo UI App'), findsOneWidget);
    expect(find.text('UI foundation is ready'), findsOneWidget);
  });
}
