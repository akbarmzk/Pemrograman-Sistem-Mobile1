// ==================== STEP 1 ====================

void main() {
  // Variables & Data Types
  var namaProduk = 'Laptop ASUS';
  namaProduk = 'Laptop Lenovo';

  final hargaProduk = 7500000;
  const pajak = 0.11;

  int stock = 10;
  double harga = 7500000;
  String nama = 'Laptop ASUS';
  bool tersedia = true;

  print('=== STEP 1: VARIABLES & DATA TYPES ===');
  print('Nama Produk: $namaProduk');
  print('Harga: $hargaProduk');
  print('Pajak: $pajak');
  print('Stock: $stock');
  print('Harga: $harga');
  print('Nama: $nama');
  print('Tersedia: $tersedia');

  List<String> kategori = [
    'Elektronik',
    'Fashion',
    'Makanan',
  ];

  print('Kategori: $kategori');

  Map<String, dynamic> rawProduct = {
    'id': 'P001',
    'name': 'Laptop ASUS',
    'price': 7500000,
    'stock': 10,
  };

  print('Raw Product: $rawProduct');


  // ==================== STEP 2 ====================

  print('\n=== STEP 2: OPERATORS ===');

  double hargaAwal = 100000;
  double diskon = 10000;

  // Arithmetic
  print('Penjumlahan: ${hargaAwal + diskon}');
  print('Pengurangan: ${hargaAwal - diskon}');
  print('Perkalian: ${hargaAwal * 2}');
  print('Pembagian: ${hargaAwal / 2}');
  print('Modulus: ${hargaAwal % 30000}');

  // Comparison
  print('Harga == 100000: ${hargaAwal == 100000}');
  print('Harga != 50000: ${hargaAwal != 50000}');
  print('Harga > 50000: ${hargaAwal > 50000}');
  print('Harga < 200000: ${hargaAwal < 200000}');
  print('Harga >= 100000: ${hargaAwal >= 100000}');
  print('Harga <= 100000: ${hargaAwal <= 100000}');

  // Logical
  bool bisaDitampilkan = stock > 0 && harga > 0;

  print('Bisa ditampilkan: $bisaDitampilkan');
  print('OR: ${stock > 0 || harga < 0}');
  print('NOT: ${!tersedia}');


  // ==================== STEP 3 ====================

  print('\n=== STEP 3: CONTROL FLOW ===');

  // If-else
  if (stock == 0) {
    print('Status Stok: Habis');
  } else if (stock <= 5) {
    print('Status Stok: Stok Terbatas');
  } else {
    print('Status Stok: Tersedia');
  }

  // For
  List<double> daftarHarga = [
    100000,
    200000,
    150000,
  ];

  double totalHarga = 0;

  for (double nilai in daftarHarga) {
    totalHarga += nilai;
  }

  print('Total Harga: $totalHarga');

  // While
  int stokSementara = 3;

  while (stokSementara > 0) {
    print('Stok tersisa: $stokSementara');
    stokSementara--;
  }

  print('Stok sekarang: $stokSementara');

  // Switch
  String kategoriProduk = 'Elektronik';
  double persenDiskon;

  switch (kategoriProduk) {
    case 'Elektronik':
      persenDiskon = 10;
      break;
    case 'Fashion':
      persenDiskon = 15;
      break;
    case 'Makanan':
      persenDiskon = 5;
      break;
    default:
      persenDiskon = 0;
  }

  print(
    'Diskon kategori $kategoriProduk: $persenDiskon%',
  );


  // ==================== STEP 4 ====================

  print('\n=== STEP 4: FUNCTIONS ===');

  double hasilDiskon = hitungHargaDiskon(
    100000,
    10,
  );

  print(
    'Harga setelah diskon: '
    '${formatRupiah(hasilDiskon)}',
  );

  double hasilDiskon2 = hitungHargaSetelahDiskon(
    200000,
    persenDiskon: 15,
  );

  print(
    'Harga setelah diskon 15%: '
    '${formatRupiah(hasilDiskon2)}',
  );

  double tanpaDiskon = hitungHargaSetelahDiskon(
    200000,
  );

  print(
    'Harga tanpa diskon: '
    '${formatRupiah(tanpaDiskon)}',
  );


  // ==================== STEP 5 ====================

  print('\n=== STEP 5: CLASS PRODUCT & NULL SAFETY ===');

  Product produk1 = Product(
    id: 'P001',
    name: 'Laptop ASUS',
    price: 7500000,
    imageUrl: 'laptop.jpg',
    category: 'Elektronik',
    stock: 10,
    description: 'Laptop untuk kebutuhan kuliah',
  );

  Product produk2 = Product(
    id: 'P002',
    name: 'Mouse Wireless',
    price: 150000,
    imageUrl: 'mouse.jpg',
    category: 'Elektronik',
    stock: 3,
  );

  DiscountedProduct produk3 = DiscountedProduct(
    id: 'P003',
    name: 'Keyboard Mechanical',
    price: 500000,
    imageUrl: 'keyboard.jpg',
    category: 'Elektronik',
    stock: 7,
    description: 'Keyboard mechanical untuk gaming',
    discountPercent: 10,
  );

  produk1.tampilkanInfo();
  produk2.tampilkanInfo();

  print('Produk Diskon: ${produk3.name}');
  print(
    'Harga Awal: '
    'Rp${produk3.price.toStringAsFixed(0)}',
  );
  print(
    'Diskon: '
    '${produk3.discountPercent}%',
  );
  print(
    'Harga Setelah Diskon: '
    'Rp${produk3.getHargaSetelahDiskon().toStringAsFixed(0)}',
  );


  // ==================== TUGAS MANDIRI F ====================

  print('\n=== TUGAS MANDIRI ===');

  // Menampilkan jumlah produk
  print('Jumlah Produk: ${daftarProduk.length}');

  // Menampilkan semua produk
  for (Product produk in daftarProduk) {
    print(
      '${produk.id} - '
      '${produk.name} - '
      'Rp${produk.price.toStringAsFixed(0)} - '
      'Stok: ${produk.stock}',
    );
  }

  // Menghitung total belanja
  double totalBelanja = hitungTotalBelanja([
    daftarProduk[0],
    daftarProduk[1],
    daftarProduk[2],
  ]);

  print(
    'Total Belanja: '
    'Rp${totalBelanja.toStringAsFixed(0)}',
  );
}


// ==================== FUNCTION STEP 4 ====================

double hitungHargaDiskon(
  double harga,
  double persenDiskon,
) {
  return harga - (harga * persenDiskon / 100);
}


double hitungHargaSetelahDiskon(
  double harga, {
  double persenDiskon = 0,
}) {
  return harga - (harga * persenDiskon / 100);
}


String formatRupiah(double harga) =>
    'Rp${harga.toStringAsFixed(0)}';


// ==================== CLASS PRODUCT ====================

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;

  // Nullable
  String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    this.description,
  });

  // Method tambahan
  String getStatusStok() {
    if (stock == 0) {
      return 'Habis';
    } else if (stock <= 5) {
      return 'Stok Terbatas';
    } else {
      return 'Tersedia';
    }
  }

  void tampilkanInfo() {
    print('-------------------------');
    print('ID: $id');
    print('Nama: $name');
    print(
      'Harga: '
      'Rp${price.toStringAsFixed(0)}',
    );
    print('Kategori: $category');
    print('Stok: $stock');
    print('Status: ${getStatusStok()}');

    print(
      'Deskripsi: '
      '${description ?? "Tidak ada deskripsi"}',
    );

    print('-------------------------');
  }
}


// ==================== INHERITANCE ====================

class DiscountedProduct extends Product {
  final double discountPercent;

  DiscountedProduct({
    required super.id,
    required super.name,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    super.description,
    required this.discountPercent,
  });

  double getHargaSetelahDiskon() {
    return price - (price * discountPercent / 100);
  }
}


// ==================== TUGAS MANDIRI F NOMOR 2 ====================

// List minimal 8 produk
List<Product> daftarProduk = [
  Product(
    id: 'P001',
    name: 'Laptop ASUS',
    price: 7500000,
    imageUrl: 'laptop.jpg',
    category: 'Elektronik',
    stock: 10,
  ),

  Product(
    id: 'P002',
    name: 'Mouse Wireless',
    price: 150000,
    imageUrl: 'mouse.jpg',
    category: 'Elektronik',
    stock: 5,
  ),

  Product(
    id: 'P003',
    name: 'Keyboard Mechanical',
    price: 500000,
    imageUrl: 'keyboard.jpg',
    category: 'Elektronik',
    stock: 7,
  ),

  Product(
    id: 'P004',
    name: 'Headset Gaming',
    price: 350000,
    imageUrl: 'headset.jpg',
    category: 'Elektronik',
    stock: 8,
  ),

  Product(
    id: 'P005',
    name: 'Kaos Polos',
    price: 100000,
    imageUrl: 'kaos.jpg',
    category: 'Fashion',
    stock: 15,
  ),

  Product(
    id: 'P006',
    name: 'Celana Jeans',
    price: 250000,
    imageUrl: 'jeans.jpg',
    category: 'Fashion',
    stock: 6,
  ),

  Product(
    id: 'P007',
    name: 'Sepatu Sneakers',
    price: 450000,
    imageUrl: 'sepatu.jpg',
    category: 'Fashion',
    stock: 4,
  ),

  Product(
    id: 'P008',
    name: 'Tumbler',
    price: 120000,
    imageUrl: 'tumbler.jpg',
    category: 'Aksesoris',
    stock: 12,
  ),
];


// ==================== TUGAS MANDIRI F NOMOR 3 ====================

double hitungTotalBelanja(
  List<Product> keranjang,
) {
  double total = 0;

  for (Product produk in keranjang) {
    total += produk.price;
  }

  return total;
}