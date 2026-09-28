// ini buat model produknya bang, biar simpel aja makanya aku buat gini bang

// ini model class produk bang, jadi tiap produk punya nama, harga, ama foto bang
class Produk {
  final String nama;
  final String harga;
  final String foto;

  const Produk({
    required this.nama,
    required this.harga,
    required this.foto,
  });
}

//ini list isinya bang
const listProduk = [
  Produk(
    nama: 'Lakban Branded',
    harga: 'Rp. 100.000.000',
    foto: 'assets/images/lakban.jpg',
  ),
  Produk(
    nama: 'Celana Ancur',
    harga: 'Rp. 150.000.000',
    foto: 'assets/images/celana.jpg',
  ),
  Produk(
    nama: 'Mobil Minus Dikit',
    harga: 'Rp. 2.000.000.000',
    foto: 'assets/images/mobil.jpg',
  ),
  Produk(
    nama: 'Iphone 100 Pro Max Super Ultra Plus Limited Edition',
    harga: 'Rp. 200.000.000',
    foto: 'assets/images/iphone.jpg',
  ),
  Produk(
    nama: 'Lakban Branded',
    harga: 'Rp. 100.000.000',
    foto: 'assets/images/lakban.jpg',
  ),
  Produk(
    nama: 'Celana Ancur',
    harga: 'Rp. 150.000.000',
    foto: 'assets/images/celana.jpg',
  ),
  Produk(
    nama: 'Mobil Minus Dikit',
    harga: 'Rp. 2.000.000.000',
    foto: 'assets/images/mobil.jpg',
  ),
  Produk(
    nama: 'Iphone 100 Pro Max Super Ultra Plus Limited Edition',
    harga: 'Rp. 200.000.000',
    foto: 'assets/images/iphone.jpg',
  ),
];