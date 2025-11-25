import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/models/product.dart';
import '../../lib/widgets/product_card.dart';

void main() {
  group('ProductCard Widget Tests', () {
    final sampleProduct = Product(
      id: '1',
      name: 'Test Product',
      category: 'Shoes',
      price: 6000.0,
      imageUrl: 'assets/images/shoe1.jpg',
      rating: 4.5,
      description: 'Test description',
      sizes: [39, 40, 41],
    );

    testWidgets('should display product name', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: sampleProduct),
          ),
        ),
      );

      expect(find.text('Test Product'), findsOneWidget);
    });

    testWidgets('should display correct price formatting', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: sampleProduct),
          ),
        ),
      );

      expect(find.text('\$6000'), findsOneWidget);
    });

    testWidgets('should display star rating', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: sampleProduct),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('4.5'), findsOneWidget);
    });

    testWidgets('should show "High number" badge for expensive products', (WidgetTester tester) async {
      final expensiveProduct = Product(
        id: '2',
        name: 'Expensive Product',
        category: 'Shoes',
        price: 8000.0,
        imageUrl: 'assets/images/shoe2.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: expensiveProduct),
          ),
        ),
      );

      expect(find.text('High number'), findsOneWidget);
    });

    testWidgets('should show "Low number" badge for affordable products', (WidgetTester tester) async {
      final affordableProduct = Product(
        id: '3',
        name: 'Affordable Product',
        category: 'Shoes',
        price: 5000.0,
        imageUrl: 'assets/images/shoe3.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: affordableProduct),
          ),
        ),
      );

      expect(find.text('Low number'), findsOneWidget);
    });

    testWidgets('should have basic widget structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(product: sampleProduct),
          ),
        ),
      );

      // Check for main structural widgets
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(AspectRatio), findsOneWidget);
      expect(find.byType(Padding), findsWidgets);
    });
  });
}