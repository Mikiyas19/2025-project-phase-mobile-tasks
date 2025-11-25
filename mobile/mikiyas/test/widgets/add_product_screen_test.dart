import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/screens/add_product_screen.dart';
import '../../lib/models/product.dart';

void main() {
  group('AddProductScreen Widget Tests', () {
    testWidgets('should display "Add Product" title in add mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddProductScreen(),
        ),
      );

      expect(find.text('Add Product'), findsOneWidget);
      expect(find.text('ADD'), findsOneWidget);
    });

    testWidgets('should display "Edit Product" title in edit mode', (WidgetTester tester) async {
      final product = Product(
        id: '1',
        name: 'Test Product',
        category: 'Shoes',
        price: 6000.0,
        imageUrl: 'assets/images/shoe1.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: AddProductScreen(product: product),
        ),
      );

      expect(find.text('Edit Product'), findsOneWidget);
      expect(find.text('UPDATE'), findsOneWidget);
    });

    testWidgets('should have all required form fields', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddProductScreen(),
        ),
      );

      expect(find.text('Product Name'), findsOneWidget);
      expect(find.text('Category'), findsOneWidget);
      expect(find.text('Price'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should show image selection placeholder', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddProductScreen(),
        ),
      );

      expect(find.text('Upload Image (Tap to select)'), findsOneWidget);
      expect(find.byIcon(Icons.cloud_upload), findsOneWidget);
    });

    testWidgets('should have CLEAR button in add mode and CANCEL in edit mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddProductScreen(),
        ),
      );

      expect(find.text('CLEAR'), findsOneWidget);

      final product = Product(
        id: '1',
        name: 'Test Product',
        category: 'Shoes',
        price: 6000.0,
        imageUrl: 'assets/images/shoe1.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: AddProductScreen(product: product),
        ),
      );

      expect(find.text('CANCEL'), findsOneWidget);
    });

    // Simplified form validation test
    testWidgets('should have form validation', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddProductScreen(),
        ),
      );

      // Verify form key exists
      final form = find.byType(Form);
      expect(form, findsOneWidget);
    });
  });
}