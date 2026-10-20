
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../models/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;

  Product get product => widget.product;

  double get totalPrice => product.price * quantity;

  void increaseQuantity() {
    if (quantity < product.stock) {
      setState(() => quantity++);
    }
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() => quantity--);
    }
  }

  void addToCart() {
    final cart = Get.find<CartController>();
    final oldTotal = cart.totalItem;

    cart.addToCart(product, quantity);

    if (cart.totalItem == oldTotal &&
        cart.items.every((item) => item.product.id != product.id ||
            item.quantity < quantity)) {
      return;
    }

    Get.snackbar(
      'TokoKita',
      '$quantity ${product.name} ditambahkan ke keranjang',
      snackPosition: SnackPosition.BOTTOM,
    );

    Get.back();
  }

  String formatRupiah(double value) {
    final formatted = value.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        );

    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    final bool outOfStock = product.stock <= 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: product.imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.devices,
                          size: 100,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.devices,
                      size: 100,
                      color: Colors.grey,
                    ),
            ),
            const SizedBox(height: 20),
            Text(
              product.category,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              formatRupiah(product.price),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  outOfStock
                      ? Icons.remove_shopping_cart
                      : Icons.inventory_2_outlined,
                  color: outOfStock ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  outOfStock
                      ? 'Stok habis'
                      : 'Stok tersedia: ${product.stock}',
                  style: TextStyle(
                    color: outOfStock ? Colors.red : Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Produk ${product.name} merupakan salah satu produk '
              'elektronik yang tersedia di TokoKita. Produk ini cocok '
              'digunakan oleh mahasiswa untuk mendukung kebutuhan '
              'perkuliahan dan aktivitas sehari-hari.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Jumlah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: quantity > 1 ? decreaseQuantity : null,
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '$quantity',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed:
                      quantity < product.stock ? increaseQuantity : null,
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formatRupiah(totalPrice),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: outOfStock ? null : addToCart,
                icon: const Icon(Icons.shopping_cart),
                label: const Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
