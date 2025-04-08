


import 'package:flutter/material.dart';
import 'package:myapp/widgets/bottom_nav.dart';



class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Women',
        'image': '/placeholder.svg?height=300&width=200',
        'subcategories': [
          'Dresses',
          'Tops',
          'Pants',
          'Skirts',
          'Jackets',
          'Activewear',
          'Swimwear',
        ],
      },
      {
        'name': 'Men',
        'image': '/placeholder.svg?height=300&width=200',
        'subcategories': [
          'Shirts',
          'T-Shirts',
          'Pants',
          'Jeans',
          'Jackets',
          'Activewear',
          'Suits',
        ],
      },
      {
        'name': 'Kids',
        'image': '/placeholder.svg?height=300&width=200',
        'subcategories': [
          'Girls',
          'Boys',
          'Babies',
          'Shoes',
          'Accessories',
        ],
      },
      {
        'name': 'Accessories',
        'image': '/placeholder.svg?height=300&width=200',
        'subcategories': [
          'Bags',
          'Jewelry',
          'Watches',
          'Hats',
          'Scarves',
          'Belts',
        ],
      },
      {
        'name': 'Shoes',
        'image': '/placeholder.svg?height=300&width=200',
        'subcategories': [
          'Women\'s Shoes',
          'Men\'s Shoes',
          'Kids\' Shoes',
          'Sneakers',
          'Boots',
          'Sandals',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // TODO: Navigate to search screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey[200]!),
            ),
            child: ExpansionTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  category['image'] as String,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                category['name'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (category['subcategories'] as List).length,
                  itemBuilder: (context, subIndex) {
                    final subcategory = (category['subcategories'] as List)[subIndex];
                    return ListTile(
                      title: Text(subcategory as String),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Navigate to subcategory products
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
