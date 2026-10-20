
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  String formatRupiah(double value) {
    final formatted = value.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        );

    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    final cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ringkasan Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pesanan Kamu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: cart.items.isEmpty
                    ? const Center(
                        child: Text('Belum ada produk dalam pesanan.'),
                      )
                    : ListView.separated(
                        itemCount: cart.items.length,
                        separatorBuilder: (_, _) =>
                            const Divider(height: 24),
                        itemBuilder: (context, index) {
                          final item = cart.items[index];

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              item.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              '${item.quantity} x '
                              '${formatRupiah(item.product.price)}',
                            ),
                            trailing: Text(
                              formatRupiah(item.subtotal),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formatRupiah(cart.totalHarga),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: cart.items.isEmpty
                      ? null
                      : () {
                          cart.clearCart();
                          Get.offAllNamed('/');
                          Get.snackbar(
                            'Checkout berhasil',
                            'Terima kasih sudah berbelanja di TokoKita!',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                  child: const Text(
                    'Selesaikan Pesanan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
