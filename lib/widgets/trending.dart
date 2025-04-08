


import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/screens/product_details.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This would typically come from an API or service
    final List<Product> trendingProducts = [
      Product(
        id: '6',
        name: 'Oversized Sweater',
        description: 'Cozy oversized sweater for a relaxed look.',
        price: 69.99,
        images: ['/placeholder.svg?height=600&width=400'],
        category: 'Sweaters',
        sizes: ['S', 'M', 'L', 'XL'],
        colors: ['Beige', 'Grey', 'Black'],
        rating: 4.7,
        reviewCount: 93,
      ),
      Product(
        id: '7',
        name: 'High-Waisted Pants',
        description: 'Stylish high-waisted pants for a modern silhouette.',
        price: 79.99,
        images: ['/placeholder.svg?height=600&width=400'],
        category: 'Pants',
        sizes: ['XS', 'S', 'M', 'L', 'XL'],
        colors: ['Black', 'Navy', 'Khaki'],
        rating: 4.6,
        reviewCount: 78,
      ),
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: trendingProducts.length,
      itemBuilder: (context, index) {
        final product = trendingProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.images.first,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber[700],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${product.rating}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(${product.reviewCount})',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
