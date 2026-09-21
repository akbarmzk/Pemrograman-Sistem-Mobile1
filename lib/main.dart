import 'package:flutter/material.dart';

import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<Product> get products {
    return [
      Product(
        id: 'P001',
        name: 'Laptop ASUS',
        price: 7500000,
        imageUrl: 'laptop.jpg',
        category: 'Elektronik',
        stock: 10,
        description: 'Laptop untuk kebutuhan kuliah',
      ),

      Product(
        id: 'P002',
        name: 'Mouse Wireless',
        price: 150000,
        imageUrl: 'mouse.jpg',
        category: 'Elektronik',
        stock: 3,
        description: null,
      ),

      Product(
        id: 'P003',
        name: 'Keyboard Mechanical',
        price: 500000,
        imageUrl: 'keyboard.jpg',
        category: 'Elektronik',
        stock: 7,
        description: 'Keyboard mechanical untuk gaming',
      ),

      Product(
        id: 'P004',
        name: 'Headset Gaming',
        price: 350000,
        imageUrl: 'headset.jpg',
        category: 'Elektronik',
        stock: 0,
        description: 'Headset gaming',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TokoKita'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}