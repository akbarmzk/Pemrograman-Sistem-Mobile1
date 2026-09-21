import 'package:flutter/material.dart';

import '../models/product.dart';
import 'price_label.dart';
import 'stock_badge.dart';

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

  @override
  void initState() {
    super.initState();

    print('ProductCard initState: ${widget.product.name}');
  }

  @override
  Widget build(BuildContext context) {
    print('ProductCard build: ${widget.product.name}');

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder gambar
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.image,
                size: 45,
                color: Colors.grey,
              ),
            ),

            const SizedBox(width: 16),

            // Informasi produk
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  PriceLabel(
                    harga: widget.product.price,
                  ),

                  const SizedBox(height: 8),

                  StockBadge(
                    stock: widget.product.stock,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.product.category,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            // Tombol favorit
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });

                print(
                  'Favorite ${widget.product.name}: $isFavorite',
                );
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
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('ProductCard dispose: ${widget.product.name}');

    super.dispose();
  }
}