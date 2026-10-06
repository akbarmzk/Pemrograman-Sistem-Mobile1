import 'package:flutter/material.dart';
import 'home_page.dart';
import '../models/product.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    CartController.instance.addListener(
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
    CartController.instance.removeListener(
      _refresh,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cart = CartController.instance;

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            label: 'Beranda',
          ),

          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                ),

                if (cart.totalItems > 0)
                  Positioned(
                    right: -8,
                    top: -8,
                    child: _CartBadge(
                      count: cart.totalItems,
                    ),
                  ),
              ],
            ),

            activeIcon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_cart,
                ),

                if (cart.totalItems > 0)
                  Positioned(
                    right: -8,
                    top: -8,
                    child: _CartBadge(
                      count: cart.totalItems,
                    ),
                  ),
              ],
            ),

            label: 'Keranjang',
          ),

          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// BADGE
// =====================================================

class _CartBadge extends StatelessWidget {
  final int count;

  const _CartBadge({
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 2,
      ),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// =====================================================
// CART PAGE
// =====================================================

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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

  String formatRupiah(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        );

    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: cart.items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Keranjang masih kosong',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Tambahkan produk terlebih dahulu.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      final item =
                          cart.items[index];

                      final product =
                          item.product;

                      return Card(
                        margin:
                            const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(
                            12,
                          ),
                          child: Row(
                            children: [
                              // GAMBAR
                              Container(
                                width: 80,
                                height: 80,
                                decoration:
                                    BoxDecoration(
                                  color: Colors
                                      .grey.shade100,
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    10,
                                  ),
                                ),
                                child: product
                                        .imageUrl
                                        .isNotEmpty
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius
                                                .circular(
                                          10,
                                        ),
                                        child:
                                            Image.network(
                                          product
                                              .imageUrl,
                                          fit: BoxFit
                                              .cover,
                                          errorBuilder:
                                              (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return const Icon(
                                              Icons
                                                  .devices,
                                              size: 40,
                                              color: Colors
                                                  .grey,
                                            );
                                          },
                                        ),
                                      )
                                    : const Icon(
                                        Icons.devices,
                                        size: 40,
                                        color:
                                            Colors.grey,
                                      ),
                              ),

                              const SizedBox(
                                width: 12,
                              ),

                              // DETAIL
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    Text(
                                      product.name,
                                      maxLines: 2,
                                      overflow:
                                          TextOverflow
                                              .ellipsis,
                                      style:
                                          const TextStyle(
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                        fontSize: 15,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 6,
                                    ),

                                    Text(
                                      formatRupiah(
                                        product.price,
                                      ),
                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.blue,
                                        fontWeight:
                                            FontWeight
                                                .bold,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 8,
                                    ),

                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cart
                                                .decreaseQuantity(
                                              product.id,
                                            );
                                          },
                                          icon:
                                              const Icon(
                                            Icons.remove,
                                          ),
                                          constraints:
                                              const BoxConstraints(
                                            minWidth:
                                                32,
                                            minHeight:
                                                32,
                                          ),
                                          padding:
                                              EdgeInsets
                                                  .zero,
                                        ),

                                        Text(
                                          '${item.quantity}',
                                          style:
                                              const TextStyle(
                                            fontWeight:
                                                FontWeight
                                                    .bold,
                                          ),
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            cart
                                                .increaseQuantity(
                                              product.id,
                                            );
                                          },
                                          icon:
                                              const Icon(
                                            Icons.add,
                                          ),
                                          constraints:
                                              const BoxConstraints(
                                            minWidth:
                                                32,
                                            minHeight:
                                                32,
                                          ),
                                          padding:
                                              EdgeInsets
                                                  .zero,
                                        ),

                                        const Spacer(),

                                        IconButton(
                                          onPressed: () {
                                            cart
                                                .removeFromCart(
                                              product.id,
                                            );
                                          },
                                          icon:
                                              const Icon(
                                            Icons
                                                .delete_outline,
                                            color:
                                                Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // TOTAL
                Container(
                  padding:
                      const EdgeInsets.fromLTRB(
                    16,
                    16,
                    16,
                    20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withValues(
                          alpha: 0.08,
                        ),
                        blurRadius: 10,
                        offset: const Offset(
                          0,
                          -3,
                        ),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Total Belanja',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          Text(
                            formatRupiah(
                              cart.totalPrice,
                            ),
                            style:
                                const TextStyle(
                              fontSize: 20,
                              color:
                                  Colors.blue,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child:
                            ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Checkout berhasil diproses!',
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'Checkout',
                            style:
                                TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

// =====================================================
// PROFILE
// =====================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: const Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            SizedBox(height: 16),

            Text(
              'Mahasiswa TokoKita',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              'Profil Pengguna',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}