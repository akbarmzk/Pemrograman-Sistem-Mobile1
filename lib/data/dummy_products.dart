
import '../models/product.dart';

final List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'Samsung Galaxy A55',
    price: 5999000,
    category: 'Smartphone',
    stock: 15,
  ),

  DiscountedProduct(
    id: '2',
    name: 'Xiaomi Redmi Note 13',
    price: 3299000,
    category: 'Smartphone',
    stock: 20,
    discountPercent: 15,
  ),

  Product(
    id: '3',
    name: 'Lenovo IdeaPad Slim 3',
    price: 7499000,
    category: 'Laptop',
    stock: 8,
  ),

  DiscountedProduct(
    id: '4',
    name: 'ASUS VivoBook 14',
    price: 8999000,
    category: 'Laptop',
    stock: 5,
    discountPercent: 10,
  ),

  Product(
    id: '5',
    name: 'Logitech G102',
    price: 275000,
    category: 'Aksesoris',
    stock: 30,
  ),

  DiscountedProduct(
    id: '6',
    name: 'Headset JBL Tune 510BT',
    price: 799000,
    category: 'Audio',
    stock: 12,
    discountPercent: 20,
  ),

  Product(
    id: '7',
    name: 'Mechanical Keyboard Fantech',
    price: 650000,
    category: 'Aksesoris',
    stock: 18,
  ),

  Product(
    id: '8',
    name: 'Mouse Wireless Logitech M331',
    price: 350000,
    category: 'Aksesoris',
    stock: 25,
  ),

  DiscountedProduct(
    id: '9',
    name: 'Samsung Galaxy Buds FE',
    price: 1399000,
    category: 'Audio',
    stock: 10,
    discountPercent: 12,
  ),

  Product(
    id: '10',
    name: 'Acer Aspire 5',
    price: 8299000,
    category: 'Laptop',
    stock: 7,
  ),

  DiscountedProduct(
    id: '11',
    name: 'Powerbank Anker 20000mAh',
    price: 599000,
    category: 'Aksesoris',
    stock: 14,
    discountPercent: 15,
  ),

  Product(
    id: '12',
    name: 'iPad 10th Generation',
    price: 6499000,
    category: 'Tablet',
    stock: 6,
  ),

  Product(
    id: '13',
    name: 'Xiaomi Redmi Watch',
    price: 899000,
    category: 'Wearable',
    stock: 0,
  ),

  DiscountedProduct(
    id: '14',
    name: 'SanDisk SSD Portable 1TB',
    price: 1599000,
    category: 'Penyimpanan',
    stock: 9,
    discountPercent: 18,
  ),

  Product(
    id: '15',
    name: 'Webcam Logitech C270',
    price: 399000,
    category: 'Aksesoris',
    stock: 16,
  ),
];