void main() {
  // STEP 1

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

  // STEP 2

  print('\n=== STEP 2: OPERATORS ===');

  double hargaAwal = 100000;
  double diskon = 10000;

  print('Penjumlahan: ${hargaAwal + diskon}');
  print('Pengurangan: ${hargaAwal - diskon}');
  print('Perkalian: ${hargaAwal * 2}');
  print('Pembagian: ${hargaAwal / 2}');
  print('Modulus: ${hargaAwal % 30000}');

  print('Harga == 100000: ${hargaAwal == 100000}');
  print('Harga != 50000: ${hargaAwal != 50000}');
  print('Harga > 50000: ${hargaAwal > 50000}');
  print('Harga < 200000: ${hargaAwal < 200000}');
  print('Harga >= 100000: ${hargaAwal >= 100000}');
  print('Harga <= 100000: ${hargaAwal <= 100000}');

  bool bisaDitampilkan = stock > 0 && harga > 0;

  print('Bisa ditampilkan: $bisaDitampilkan');
  print('OR: ${stock > 0 || harga < 0}');
  print('NOT: ${!tersedia}');

  // STEP 3

  print('\n=== STEP 3: CONTROL FLOW ===');

  if (stock == 0) {
    print('Status Stok: Habis');
  } else if (stock <= 5) {
    print('Status Stok: Stok Terbatas');
  } else {
    print('Status Stok: Tersedia');
  }

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

  int stokSementara = 3;

  while (stokSementara > 0) {
    print('Stok tersisa: $stokSementara');
    stokSementara--;
  }

  print('Stok sekarang: $stokSementara');

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

  // STEP 4

  print('\n=== STEP 4: FUNCTIONS ===');

  double hasilDiskon = hitungHargaDiskon(
    100000,
    10,
  );

  print(
    'Harga setelah diskon: ${formatRupiah(hasilDiskon)}',
  );

  double hasilDiskon2 = hitungHargaSetelahDiskon(
    200000,
    persenDiskon: 15,
  );

  print(
    'Harga setelah diskon 15%: ${formatRupiah(hasilDiskon2)}',
  );

  double tanpaDiskon = hitungHargaSetelahDiskon(
    200000,
  );

  print(
    'Harga tanpa diskon: ${formatRupiah(tanpaDiskon)}',
  );

  // STEP 5

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
    'Harga Awal: Rp${produk3.price.toStringAsFixed(0)}',
  );
  print('Diskon: ${produk3.discountPercent}%');
  print(
    'Harga Setelah Diskon: '
    'Rp${produk3.getHargaSetelahDiskon().toStringAsFixed(0)}',
  );
}

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

class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  int stock;
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
      'Harga: Rp${price.toStringAsFixed(0)}',
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