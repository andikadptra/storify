import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getDataUser() async {
  var url = Uri.parse('http://192.168.2.124/storify/getUser.php');
  var response = await http.get(url);
  
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
