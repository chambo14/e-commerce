import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_app/main.dart';

void main() {
  testWidgets('App démarre sur l\'écran de connexion', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: ECommerceApp()),
    );
    await tester.pump();
    expect(find.text('Bienvenue !'), findsOneWidget);
  });
}
