import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip.dart';

class DataSenderPengambilan {
  static String apiUrl = 'http://${ip}//storify';

  static Future<bool> sendData(PengambilanBarang pengambilanBarang) async {
    final url = '$apiUrl/sendDataPengambilanBarang.php';
    final response = await http.post(Uri.parse(url), body: {
      'Tgl_pengambilan': pengambilanBarang.tglPengambilan,
      'Jumlah_barang': pengambilanBarang.jumlahBarang.toString(),
      'Keterangan': pengambilanBarang.keterangan,
      'Id_pelanggan': pengambilanBarang.idPelanggan,
      'Kode_barang': pengambilanBarang.kodeBarang,
      'penginput': pengambilanBarang.penginput,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['success'] == true;
    } else {
      throw Exception('Failed to send data');
    }
  }
}

class PengambilanBarang {
  String tglPengambilan;
  int jumlahBarang;
  String keterangan;
  String idPelanggan;
  String kodeBarang;
  String penginput;

  PengambilanBarang({
    required this.tglPengambilan,
    required this.jumlahBarang,
    required this.keterangan,
    required this.idPelanggan,
    required this.kodeBarang,
    required this.penginput,
  });
}
