import 'dart:convert';
import 'package:http/http.dart' as http;

class DataFetcher {
  static const String apiUrl = 'http://192.168.2.124/storify';

  static Future<List<Map<String, dynamic>>> fetchData() async {
    final url = '$apiUrl/fetchDataBarang.php';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonData);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
