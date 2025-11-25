import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/screens/details_screen.dart';
import '../../lib/models/product.dart';

void main() {
  group('DetailsScreen Widget Tests', () {
    final sampleProduct = Product(
      id: '1',
      name: 'Test Product',
      category: 'Shoes',
      price: 6000.0,
      imageUrl: 'assets/images/shoe1.jpg',
      rating: 4.5,
      description: 'This is a test product description.',
      sizes: [39, 40, 41, 42],
    );

    testWidgets('should display product name', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(product: sampleProduct),
        ),
      );

      expect(find.text('Test Product'), findsOneWidget);
    });

    testWidgets('should display product prices', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(product: sampleProduct),
        ),
      );

      expect(find.text('\$6000'), findsOneWidget);
      expect(find.text('\$7200'), findsOneWidget);
    });

    testWidgets('should display available sizes', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(product: sampleProduct),
        ),
      );

      expect(find.text('39'), findsOneWidget);
      expect(find.text('40'), findsOneWidget);
      expect(find.text('41'), findsOneWidget);
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('should display product description', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(product: sampleProduct),
        ),
      );

      expect(find.text('This is a test product description.'), findsOneWidget);
    });

    testWidgets('should have action buttons for UPDATE and DELETE', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(product: sampleProduct),
        ),
      );

      expect(find.text('UPDATE'), findsOneWidget);
      expect(find.text('DELETE'), findsOneWidget);
    });

    testWidgets('should have back button in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DetailsScreen(product: sampleProduct),
        ),
      );

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });
  });
}