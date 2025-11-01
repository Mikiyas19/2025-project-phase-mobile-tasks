class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);

  String displayDetails(int index) {
    return '$index. Name: $name, Description: $description, Price: \$${price.toStringAsFixed(2)}';
  }
}
