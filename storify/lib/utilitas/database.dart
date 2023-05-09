class Barang {
  final int id_barang;
  final String nama_barang;
  final int stok_barang;
  final String foto;

  Barang({required this.id_barang, required this.nama_barang, required this.stok_barang, required this.foto});

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id_barang: json['id_barang'],
      nama_barang: json['nama_barang'],
      stok_barang: json['stok_barang'],
      foto: json['foto']
    );
  }
}

class Transaksi {
  final int id_barang;
  final int barang_masuk;
  final int barang_keluar;
  final String foto;

  Transaksi({required this.id_barang, required this.barang_masuk, required this.barang_keluar, required this.foto});

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
      id_barang: json['id_barang'],
      barang_masuk: json['barang_masuk'],
      barang_keluar: json['barang_keluar'],
      foto: json['foto']
    );
  }
}

class Supplier {
  final int id_barang;
  final String nama_barang;
  final int stok_barang;
  final String foto;

  Supplier({required this.id_barang, required this.nama_barang, required this.stok_barang, required this.foto});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id_barang: json['id_barang'],
      nama_barang: json['nama_barang'],
      stok_barang: json['stok_barang'],
      foto: json['foto'],
    );
  }
}

class User {
  final int id_user;
  final String password;
  final String jabatan;

  User({required this.id_user, required this.password, required this.jabatan});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id_user: json['id_user'],
      password: json['password'],
      jabatan: json['jabatan'],
    );
  }
}

  List<Barang> daftarBarang = [
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
    Barang(id_barang: 1, nama_barang: "Buku Tulis", stok_barang: 100, foto: "img-1"),
    Barang(id_barang: 2, nama_barang: "Buku Gambar", stok_barang: 50, foto: "img-2"),
    Barang(id_barang: 3, nama_barang: "Pensil", stok_barang: 200, foto: "img-3"),
  ];

  List<Transaksi> daftarTransaksi = [
    Transaksi(id_barang: 1, barang_masuk: 20, barang_keluar: 0, foto: "img-1"),
    Transaksi(id_barang: 2, barang_masuk: 0, barang_keluar: 10, foto: "img-2"),
    Transaksi(id_barang: 3, barang_masuk: 50, barang_keluar: 30, foto: "img-3"),
  ];

  List<Supplier> daftarSupplier = [
    Supplier(id_barang: 1, nama_barang: "Buku Tulis A", stok_barang: 50, foto: "img-1"),
    Supplier(id_barang: 2, nama_barang: "Buku Gambar B", stok_barang: 30, foto: "img-2"),
    Supplier(id_barang: 3, nama_barang: "Pensil C", stok_barang: 100, foto: "img-3"),
  ];

  List<User> daftarUser = [
    User(id_user: 1, password: "password1", jabatan: "admin"),
    User(id_user: 2, password: "password2", jabatan: "staff"),
    User(id_user: 3, password: "password3", jabatan: "kepala"),
  ];