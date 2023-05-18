import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip.dart';

class DataSender {
  static String apiUrl = 'http://${ip}//storify';

  static Future<bool> sendData(Barang barang) async {
    final url = '$apiUrl/sendDataProduct.php';
    final response = await http.post(Uri.parse(url), body: {
      'kode_barang': barang.kodeBarang,
      'nama_barang': barang.namaBarang,
      'kode_jenis_barang': barang.kodeJenisBarang,
      'harga': barang.harga.toString(),
      'stok': barang.stok.toString(),
      'deskripsi': barang.deskripsi,
      'image': barang.image,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['success'] == true;
    } else {
      throw Exception('Failed to send data');
    }
  }
}

class Barang {
  String kodeBarang;
  String namaBarang;
  String kodeJenisBarang;
  int harga;
  int stok;
  String deskripsi;
  String image;

  Barang({
    required this.kodeBarang,
    required this.namaBarang,
    required this.kodeJenisBarang,
    required this.harga,
    required this.stok,
    required this.deskripsi,
    required this.image,
  });
}
