import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip.dart';

Future<void> editData(String kodeBarang, String namaBarang, String kodeJenisBarang, String harga, String stok, String deskripsi, String image) async {
  final url = Uri.parse("http://${ip}/storify/editProduct.php");
  final response = await http.post(url, body: {
    'kode_barang': kodeBarang,
    'nama_barang': namaBarang,
    'kode_jenis_barang': kodeJenisBarang,
    'harga': harga,
    'stok': stok,
    'deskripsi': deskripsi,
    'image': image,
  });

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    if (jsonData['success']) {
      print('Data edited successfully');
    } else {
      print('Failed to edit data');
    }
  } else {
    print('Error: ${response.statusCode}');
  }
}
