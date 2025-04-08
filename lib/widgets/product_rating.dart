


import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const ProductRating({
    Key? key,
    required this.rating,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < rating.floor()
                  ? Icons.star
                  : (index < rating.ceil() && index > rating.floor())
                      ? Icons.star_half
                      : Icons.star_border,
              color: Colors.amber[700],
              size: 18,
            );
          }),
        ),
        const SizedBox(width: 8),
        Text(
          '$rating',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount reviews)',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
