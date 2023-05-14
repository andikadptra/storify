import 'package:http/http.dart' as http;

Future<void> deleteBarang(int idBarang) async {
  var url = Uri.parse('http://192.168.2.124/storify/delete_barang.php'); // Ganti sesuai alamat server dan nama file PHP Anda

  try {
    var response = await http.post(url, body: {'id_barang': idBarang.toString()});
    print(response.body);
  } catch (e) {
    print('Error: $e');
  }
}