import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nana_mobile_task/main.dart' as nana_app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Integration Test", () {
    testWidgets('Verify Product Screen', (tester) async {
      nana_app.main();
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('appBarKey')), findsOneWidget);
      expect(find.byKey(const Key('1')), findsAny);
      expect(find.text("Snacks Product"), findsWidgets);
      expect(find.text("Most use product"), findsWidgets);
      expect(find.text("Recommendation"), findsWidgets);
    });
  });
}
