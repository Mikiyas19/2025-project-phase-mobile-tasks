import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/screens/home_screen.dart';

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should display app bar with notification icon', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byIcon(Icons.notifications_none), findsOneWidget);
    });

    testWidgets('should display user greeting section', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text('Hello, Yohannes'), findsOneWidget);
      expect(find.text('July 13, 2023'), findsOneWidget);
    });

    testWidgets('should display "Available Products" title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.text('Available Products'), findsOneWidget);
    });

    testWidgets('should display initial product grid', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      // Check that we have a GridView
      expect(find.byType(GridView), findsOneWidget);

      // Check for initial products
      expect(find.text('Classic Cap-Toe Derby'), findsOneWidget);
      expect(find.text('Monk Strap Buckle Shoe'), findsOneWidget);
    });

    testWidgets('should have floating action button for adding products', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      final fabIcon = find.descendant(of: fab, matching: find.byIcon(Icons.add));
      expect(fabIcon, findsOneWidget);
    });
  });
}