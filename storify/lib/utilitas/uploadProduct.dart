import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class DataUploader {
  static const String apiUrl = 'http://192.168.2.124/storify';

  static Future<String> uploadData(String kodeBarang, String namaBarang, String kodeJenisBarang,
      int harga, int stok) async {

    // Upload data to database
    final url = '$apiUrl/uploadData.php';
    final data = {
      'kode_barang': kodeBarang,
      'nama_barang': namaBarang,
      'kode_jenis_barang': kodeJenisBarang,
      'harga': harga.toString(),
      'stok': stok.toString(),
    };
    final response = await http.post(Uri.parse(url), body: data);

    return response.body;
  }
}
