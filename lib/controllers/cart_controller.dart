
import 'package:get/get.dart';
import '../models/product.dart';

class CartController extends GetxController {
  final RxList<CartItem> items = <CartItem>[].obs;

  int get totalItem =>
      items.fold(0, (total, item) => total + item.quantity);

  double get totalHarga =>
      items.fold(0, (total, item) => total + item.subtotal);

  void addToCart(Product product, [int quantity = 1]) {
    if (quantity < 1) return;

    final index = items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index != -1) {
      final item = items[index];
      final newQuantity = item.quantity + quantity;

      if (newQuantity > item.product.stock) {
        Get.snackbar(
          'Stok tidak cukup',
          'Jumlah melebihi stok ${product.name}.',
        );
        return;
      }

      items[index].quantity = newQuantity;
      items.refresh();
    } else {
      if (quantity > product.stock) {
        Get.snackbar(
          'Stok tidak cukup',
          'Jumlah melebihi stok ${product.name}.',
        );
        return;
      }

      items.add(CartItem(product: product, quantity: quantity));
    }
  }

  void increaseQuantity(String productId) {
    final index = items.indexWhere(
      (item) => item.product.id == productId,
    );
    if (index == -1) return;

    final item = items[index];
    if (item.quantity < item.product.stock) {
      item.quantity++;
      items.refresh();
    }
  }

  void decreaseQuantity(String productId) {
    final index = items.indexWhere(
      (item) => item.product.id == productId,
    );
    if (index == -1) return;

    if (items[index].quantity > 1) {
      items[index].quantity--;
      items.refresh();
    } else {
      items.removeAt(index);
    }
  }

  void removeFromCart(Product product) {
    items.removeWhere(
      (item) => item.product.id == product.id,
    );
  }

  void clearCart() {
    items.clear();
  }
}
