import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip.dart';

class DataFetcher {
  static String apiUrl = 'http://${ip}/storify';

  static Future<List<dynamic>> fetchPelangganData() async {
    final url = Uri.parse('$apiUrl/getPelanggan.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

// Contoh penggunaan
// Future<void> main() async {
//   try {
//     final data = await DataFetcher.fetchPelangganData();
//     print(data);
//   } catch (error) {
//     print('Error: $error');
//   }
// }
