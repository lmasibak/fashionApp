



import 'package:flutter/material.dart';
import 'package:myapp/models/cart_item.dart';
import 'package:myapp/models/product.dart' show Product;

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];
  
  List<CartItem> get items => _items;
  
  int get itemCount => _items.length;
  
  double get subtotal => _items.fold(0, (sum, item) => sum + item.totalPrice);
  
  double get shipping => _items.isEmpty ? 0 : 5.99;
  
  double get tax => subtotal * 0.1; // 10% tax
  
  double get total => subtotal + shipping + tax;
  
  void addItem(Product product, String size, String color, {int quantity = 1}) {
    // Check if the item already exists with the same product, size, and color
    final existingIndex = _items.indexWhere(
      (item) => item.product.id == product.id && item.size == size && item.color == color,
    );
    
    if (existingIndex >= 0) {
      // Update quantity if the item already exists
      _items[existingIndex].quantity += quantity;
    } else {
      // Add new item
      _items.add(
        CartItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          product: product,
          size: size,
          color: color,
          quantity: quantity,
        ),
      );
    }
    
    notifyListeners();
  }
  
  void updateQuantity(String itemId, int quantity) {
    if (quantity < 1) return;
    
    final index = _items.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }
  
  void removeItem(String itemId) {
    _items.removeWhere((item) => item.id == itemId);
    notifyListeners();
  }
  
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
