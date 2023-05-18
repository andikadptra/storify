import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip.dart';

Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('http://${ip}/storify/getBarang.php'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return jsonData;
  } else {
    throw Exception('Failed to fetch data');
  }
}

// void main() async {
//   try {
//     final data = await fetchData();
//     print(data);
//   } catch (error) {
//     print('Error: $error');
//   }
// }
