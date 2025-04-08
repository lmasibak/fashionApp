




class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String category;
  final List<String> sizes;
  final List<String> colors;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final bool isNew;
  final bool isOnSale;
  final double discountPercentage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.sizes,
    required this.colors,
    required this.rating,
    required this.reviewCount,
    this.isFeatured = false,
    this.isNew = false,
    this.isOnSale = false,
    this.discountPercentage = 0.0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      images: List<String>.from(json['images']),
      category: json['category'],
      sizes: List<String>.from(json['sizes']),
      colors: List<String>.from(json['colors']),
      rating: json['rating'].toDouble(),
      reviewCount: json['review_count'],
      isFeatured: json['is_featured'] ?? false,
      isNew: json['is_new'] ?? false,
      isOnSale: json['is_on_sale'] ?? false,
      discountPercentage: json['discount_percentage']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'category': category,
      'sizes': sizes,
      'colors': colors,
      'rating': rating,
      'review_count': reviewCount,
      'is_featured': isFeatured,
      'is_new': isNew,
      'is_on_sale': isOnSale,
      'discount_percentage': discountPercentage,
    };
  }
}
