


import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart' show Product;
import 'package:myapp/screens/product_details.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This would typically come from an API or service
    final List<Product> newProducts = [
      Product(
        id: '3',
        name: 'Slim Fit Jeans',
        description: 'Classic slim fit jeans with a modern twist.',
        price: 49.99,
        images: ['/placeholder.svg?height=600&width=400'],
        category: 'Jeans',
        sizes: ['28', '30', '32', '34', '36'],
        colors: ['Blue', 'Black', 'Grey'],
        rating: 4.3,
        reviewCount: 67,
        isNew: true,
      ),
      Product(
        id: '4',
        name: 'Graphic T-Shirt',
        description: 'Comfortable cotton t-shirt with a unique graphic design.',
        price: 24.99,
        images: ['/placeholder.svg?height=600&width=400'],
        category: 'T-Shirts',
        sizes: ['S', 'M', 'L', 'XL'],
        colors: ['White', 'Black', 'Grey'],
        rating: 4.1,
        reviewCount: 42,
        isNew: true,
      ),
      Product(
        id: '5',
        name: 'Leather Jacket',
        description: 'Premium leather jacket for a timeless look.',
        price: 199.99,
        images: ['/placeholder.svg?height=600&width=400'],
        category: 'Jackets',
        sizes: ['S', 'M', 'L', 'XL'],
        colors: ['Black', 'Brown'],
        rating: 4.9,
        reviewCount: 28,
        isNew: true,
      ),
    ];

    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: newProducts.length,
        itemBuilder: (context, index) {
          final product = newProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Container(
              width: 180,
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          product.images.first,
                          height: 200,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
