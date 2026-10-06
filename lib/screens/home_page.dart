import 'package:flutter/material.dart';
import '../data/dummy_products.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cart = CartController.instance;

  @override
  void initState() {
    super.initState();

    cart.addListener(
      _refresh,
    );
  }

  void _refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    cart.removeListener(
      _refresh,
    );

    super.dispose();
  }

  void openCart() {
    Navigator.pushNamed(
      context,
      '/cart',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        title: const Text(
          'TokoKita',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: openCart,
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),

              if (cart.totalItems > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration:
                        const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cart.totalItems}',
                      style:
                          const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              24,
            ),
            decoration:
                const BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.only(
                bottomLeft:
                    Radius.circular(24),
                bottomRight:
                    Radius.circular(24),
              ),
            ),
            child: const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat datang frenn !!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                SizedBox(height: 6),

                Text(
                  'Temukan kebutuhan kuliahmu di TokoKita.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // PRODUK
          Expanded(
            child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              itemCount:
                  dummyProducts.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 310,
              ),

              itemBuilder: (
                context,
                index,
              ) {
                return ProductCard(
                  product:
                      dummyProducts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}