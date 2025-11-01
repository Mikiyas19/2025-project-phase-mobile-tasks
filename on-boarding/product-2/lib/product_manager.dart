import 'package:product_2/product.dart';
import 'dart:io';

class ProductManager {
  final List<Product> _items = [];

  int? _readProductIndex(String prompt) {
    stdout.write(prompt);
    String? index = stdin.readLineSync();
    int? idx = int.tryParse(index ?? '');

    if (idx != null && idx >= 1 && idx <= _items.length) {
      return idx - 1;
    }
    return null;
  }

  void addProduct() {
    stdout.write("Product name: ");
    String? name = stdin.readLineSync()?.trim();
    stdout.write("Description of the product: ");
    String? description = stdin.readLineSync()?.trim();
    stdout.write("Price of the product: ");
    String? priceInput = stdin.readLineSync();
    double? price = double.tryParse(priceInput ?? '');

    if (name != null &&
        name.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        price != null &&
        price > 0) {
      _items.add(Product(name, description, price));
      print("✅ Product added successfully!");
    } else {
      print(
        "❌ Invalid input. Please ensure name, description, and a positive price are provided.",
      );
    }
  }

  void viewAllProduct() {
    if (_items.isEmpty) {
      print("No products available.");
      return;
    }
    print("\n--- ALL PRODUCTS ---");
    for (int x = 0; x < _items.length; x++) {
      print(_items[x].displayDetails(x + 1));
    }
    print("--------------------");
  }

  void viewSingleProduct() {
    if (_items.isEmpty) {
      print("No products available.");
      return;
    }

    int? index = _readProductIndex("Enter the product number to view: ");

    if (index != null) {
      Product product = _items[index];
      print('\n--- PRODUCT DETAILS ---');
      print('Name: ${product.name}');
      print('Description: ${product.description}');
      print('Price: \$${product.price.toStringAsFixed(2)}');
      print('-----------------------');
    } else {
      print("❌ Invalid product number.");
    }
  }

  void editProduct() {
    if (_items.isEmpty) {
      print("No products available to edit.");
      return;
    }

    int? index = _readProductIndex('Enter the product number to edit: ');

    if (index != null) {
      Product product = _items[index];
      print("Editing Product ${index + 1}: ${product.name}");

      stdout.write("New name (${product.name}): ");
      String? newName = stdin.readLineSync()?.trim();
      if (newName != null && newName.isNotEmpty) {
        product.name = newName;
      }

      stdout.write("New description (${product.description}): ");
      String? newDescription = stdin.readLineSync()?.trim();
      if (newDescription != null && newDescription.isNotEmpty) {
        product.description = newDescription;
      }

      stdout.write("New price (${product.price}): ");
      String? priceValue = stdin.readLineSync();
      double? newPrice = double.tryParse(priceValue ?? '');
      if (newPrice != null && newPrice > 0) {
        product.price = newPrice;
      }

      print("✨ Product updated successfully!");
    } else {
      print("❌ Invalid product number.");
    }
  }

  void deleteProduct() {
    if (_items.isEmpty) {
      print("No products available to delete.");
      return;
    }

    int? index = _readProductIndex('Enter the product number to be deleted: ');

    if (index != null) {
      Product deletedProduct = _items.removeAt(index);
      print("🗑️ Product '${deletedProduct.name}' removed successfully.");
    } else {
      print("❌ Invalid product number.");
    }
  }
}
