
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data 15 produk
    final List<Product> products = [
      Product(
        id: '1',
        name: 'Laptop ASUS',
        price: 7500000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 10,
      ),
      Product(
        id: '2',
        name: 'Mouse Wireless',
        price: 150000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 3,
      ),
      Product(
        id: '3',
        name: 'Keyboard Mechanical',
        price: 450000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 7,
      ),
      Product(
        id: '4',
        name: 'Headset Gaming',
        price: 300000,
        imageUrl: '',
        category: 'Gaming',
        stock: 0,
      ),

      // Produk dengan diskon 20%
      DiscountedProduct(
        id: '5',
        name: 'Smartphone Samsung',
        price: 5000000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 5,
        discountPercent: 20,
      ),

      Product(
        id: '6',
        name: 'Monitor LG',
        price: 2200000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 8,
      ),
      Product(
        id: '7',
        name: 'Mousepad Gaming',
        price: 100000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 12,
      ),
      Product(
        id: '8',
        name: 'Webcam Logitech',
        price: 650000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 4,
      ),
      Product(
        id: '9',
        name: 'Speaker Bluetooth',
        price: 350000,
        imageUrl: '',
        category: 'Audio',
        stock: 6,
      ),
      Product(
        id: '10',
        name: 'Flashdisk 64GB',
        price: 90000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 15,
      ),
      Product(
        id: '11',
        name: 'Powerbank 20000mAh',
        price: 400000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 9,
      ),
      Product(
        id: '12',
        name: 'Printer Epson',
        price: 1800000,
        imageUrl: '',
        category: 'Elektronik',
        stock: 2,
      ),
      Product(
        id: '13',
        name: 'SSD 1TB',
        price: 1200000,
        imageUrl: '',
        category: 'Komputer',
        stock: 5,
      ),
      Product(
        id: '14',
        name: 'Kabel USB Type-C',
        price: 50000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 20,
      ),
      Product(
        id: '15',
        name: 'Cooling Pad Laptop',
        price: 250000,
        imageUrl: '',
        category: 'Aksesoris',
        stock: 7,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // Header aplikasi
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TokoKita',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 28,
              ),
            ),
          ],
        ),
      ),

      // Isi halaman
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul dan subtitle
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TokoKita',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Belanja jadi lebih mudah',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Daftar produk menggunakan ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}