import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSender {
  static const String apiUrl = 'http://192.168.2.124/storify';

  static Future<bool> sendData(Barang barang) async {
    final url = '$apiUrl/sendDataProduct.php';
    final response = await http.post(Uri.parse(url), body: {
      'kode_barang': barang.kodeBarang,
      'nama_barang': barang.namaBarang,
      'kode_jenis_barang': barang.kodeJenisBarang,
      'harga': barang.harga.toString(),
      'stok': barang.stok.toString(),
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

  Barang(
      {
      required this.kodeBarang,
      required this.namaBarang,
      required this.kodeJenisBarang,
      required this.harga,
      required this.stok});
}