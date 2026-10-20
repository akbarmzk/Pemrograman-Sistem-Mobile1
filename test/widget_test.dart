
import 'package:flutter_test/flutter_test.dart';
import 'package:tokokita/main.dart';

void main() {
  testWidgets('TokoKita app can be created', (WidgetTester tester) async {
    await tester.pumpWidget(const TokoKitaApp());

    expect(find.byType(TokoKitaApp), findsOneWidget);
  });
}
