import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../utils/constants.dart';
import 'details_screen.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Classic Cap-Toe Derby',
      category: 'Shoes',
      price: 6000,
      imageUrl: 'assets/images/shoe1.jpg',
      rating: 4.5,
      description: 'A formal, highly polished burgundy or dark brown Derby shoe featuring a cap toe and subtle perforated detailing around the collar. The look is sleek and modern.',
      sizes: [39, 40, 41, 42, 43, 44],
    ),
    Product(
      id: '2',
      name: 'Monk Strap Buckle Shoe',
      category: 'Shoes',
      price: 8000,
      imageUrl: 'assets/images/shoe2.jpg',
      rating: 4.3,
      description: 'A glossy, rich tan or brown leather shoe characterized by a single side buckle (Monk strap) and a sharp, pointed toe. It features light decorative stitching.',
      sizes: [39, 40, 42, 43, 44],
    ),
    Product(
      id: '3',
      name: 'Black Oxford Brogue',
      category: 'Shoes',
      price: 7500,
      imageUrl: 'assets/images/shoe3.jpg',
      rating: 4.7,
      description: 'A traditional, black leather Oxford shoe with closed lacing. It features decorative broguing (perforated patterns) along the seams, known as a semi-brogue style.',
      sizes: [40, 41, 42, 43],
    ),
    Product(
      id: '4',
      name: 'Black Penny Loafer',
      category: 'Shoes',
      price: 9000,
      imageUrl: 'assets/images/shoe4.jpg',
      rating: 4.2,
      description: 'A simple, sleek black leather slip-on shoe with a low heel. It features the characteristic leather strap across the saddle (the \'penny\' slot).',
      sizes: [39, 40, 41, 42, 44],
    ),
  ];

  void _handleProductDeletion(Product? productToDelete) {
    if (productToDelete != null) {
      setState(() {
        products.removeWhere((p) => p.id == productToDelete.id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${productToDelete.name} deleted')),
      );
    }
  }

  void _handleProductUpdate(Product? updatedProduct) {
    if (updatedProduct != null) {
      setState(() {
        final index = products.indexWhere((p) => p.id == updatedProduct.id);
        if (index != -1) {
          products[index] = updatedProduct;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${updatedProduct.name} updated')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
        backgroundColor: Colors.white,
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );
          if (newProduct != null && newProduct is Product) {
            setState(() {
              products.add(newProduct);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${newProduct.name} added')),
            );
          }
        },
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 5.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'July 13, 2023',
                      style: AppTextStyles.caption.copyWith(color: Colors.grey.shade500),
                    ),
                    Text(
                      'Hello, Yohannes',
                      style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Available Products',
              style: AppTextStyles.headlineLarge,
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180.0,
                childAspectRatio: 1 / 1.5,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(product: products[index]),
                      ),
                    );

                    if (result != null && result is Map) {
                      final action = result['action'];
                      final product = result['product'];

                      if (action == 'delete') {
                        _handleProductDeletion(product);
                      } else if (action == 'update') {
                        _handleProductUpdate(product);
                      }
                    }
                  },
                  child: ProductCard(product: products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}