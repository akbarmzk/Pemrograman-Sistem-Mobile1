import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';
import 'models/product.dart';

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
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) {
          return const MainPage();
        },

        '/detail': (context) {
          final product =
              ModalRoute.of(context)!
                  .settings
                  .arguments as Product;

          return ProductDetailPage(
            product: product,
          );
        },

        '/cart': (context) {
          return const CartPage();
        },
      },
    );
  }
}