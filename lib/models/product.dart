import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl = '',
    required this.category,
    required this.stock,
  });
}

class DiscountedProduct extends Product {
  final int discountPercent;

  const DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    super.imageUrl = '',
    required super.category,
    required super.stock,
    required this.discountPercent,
  });
}

// =====================================================
// CART ITEM
// =====================================================

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get subtotal {
    return product.price * quantity;
  }
}

// =====================================================
// CART CONTROLLER
// =====================================================

class CartController extends ChangeNotifier {
  static final CartController instance = CartController._internal();

  CartController._internal();

  final Map<String, CartItem> _items = {};

  List<CartItem> get items {
    return _items.values.toList();
  }

  int get totalItems {
    int total = 0;

    for (final item in _items.values) {
      total += item.quantity;
    }

    return total;
  }

  double get totalPrice {
    double total = 0;

    for (final item in _items.values) {
      total += item.subtotal;
    }

    return total;
  }

  void addToCart(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(
        product: product,
        quantity: quantity,
      );
    }

    notifyListeners();
  }

  void increaseQuantity(String productId) {
    final item = _items[productId];

    if (item == null) return;

    if (item.quantity < item.product.stock) {
      item.quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(String productId) {
    final item = _items[productId];

    if (item == null) return;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}