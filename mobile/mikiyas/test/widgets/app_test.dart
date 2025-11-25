import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/main.dart';
import '../../lib/screens/home_screen.dart';

void main() {
  group('App Widget Tests', () {
    testWidgets('should build MyApp without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets('should have correct app configuration', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

      expect(materialApp.title, equals('Ecommerce App'));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });
  });
}