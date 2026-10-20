
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/cart_controller.dart';
import 'models/product.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

void main() {
  Get.put(CartController(), permanent: true);
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TokoKita',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainPage(),
        ),
        GetPage(
          name: '/detail',
          page: () => ProductDetailPage(
            product: Get.arguments as Product,
          ),
        ),
        GetPage(
          name: '/cart',
          page: () => const CartPage(),
        ),
      ],
    );
  }
}
