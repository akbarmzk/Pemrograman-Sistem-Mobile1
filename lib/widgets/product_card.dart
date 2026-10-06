import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  Future<void> openProductDetail() async {
    final product = widget.product;

    final result = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: product,
    );

    if (result != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${product.name} ditambahkan sebanyak $result item',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    final bool isDiscounted =
        product is DiscountedProduct;

    double finalPrice = product.price;
    int discountPercent = 0;

    if (isDiscounted) {
      discountPercent =
          (product as DiscountedProduct).discountPercent;

      finalPrice =
          product.price * (1 - discountPercent / 100);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: openProductDetail,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // GAMBAR PRODUK
            // =========================
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey.shade100,
                    child: product.imageUrl.isNotEmpty
                        ? Image.network(
                            product.imageUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return const Center(
                                child: Icon(
                                  Icons.devices,
                                  size: 70,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Icon(
                              Icons.devices,
                              size: 70,
                              color: Colors.grey,
                            ),
                          ),
                  ),

                  // =========================
                  // BADGE DISKON
                  // =========================
                  if (isDiscounted)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '-$discountPercent%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  // =========================
                  // FAVORITE
                  // =========================
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(
                          alpha: 0.9,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // =========================
                  // STOK
                  // =========================
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: product.stock > 0
                            ? Colors.green.shade600
                            : Colors.red.shade600,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        product.stock > 0
                            ? 'Stok ${product.stock}'
                            : 'Habis',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // INFORMASI PRODUK
            // =========================
            Padding(
              padding: const EdgeInsets.fromLTRB(
                12,
                10,
                12,
                12,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  if (isDiscounted)
                    Text(
                      'Rp ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration:
                            TextDecoration.lineThrough,
                      ),
                    ),

                  Text(
                    'Rp ${finalPrice.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // =========================
                  // BELI SEKARANG
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: product.stock > 0
                          ? openProductDetail
                          : null,
                      child: Text(
                        product.stock > 0
                            ? 'Beli Sekarang'
                            : 'Stok Habis',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}