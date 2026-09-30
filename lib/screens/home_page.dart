
import 'package:flutter/material.dart';

import '../data/dummy_products.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,

        // Judul berada tepat di tengah
        centerTitle: true,

        title: const Text(
          'TokoKita',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),

      // BODY
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo!',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Temukan produk elektronik favoritmu.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // JUDUL PRODUK
          const Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              20,
              16,
              12,
            ),
            child: Text(
              'Produk Pilihan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // GRID PRODUK DUMMY
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                20,
              ),

              // Jumlah produk otomatis
              itemCount: dummyProducts.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 310,
              ),

              itemBuilder: (context, index) {
                return ProductCard(
                  product: dummyProducts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}