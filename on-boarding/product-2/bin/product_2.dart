import 'dart:io';
import 'package:product_2/product_manager.dart';

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print("\n=================================");
    print("=== Product Management System ===");
    print("=================================");
    print("1. Add Product");
    print("2. View All Products");
    print("3. View Single Product");
    print("4. Edit Product");
    print("5. Delete Product");
    print("6. Exit");
    print("---------------------------------");
    stdout.write("Choose an option: ");

    String? choice = stdin.readLineSync();

    switch (choice?.trim()) {
      case '1':
        manager.addProduct();
        break;
      case '2':
        manager.viewAllProduct();
        break;
      case '3':
        manager.viewSingleProduct();
        break;
      case '4':
        manager.editProduct();
        break;
      case '5':
        manager.deleteProduct();
        break;
      case '6':
        print("\n👋 Goodbye!");
        return;
      default:
        print("❌ Invalid option! Please try again.");
    }
  }
}
