import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ip.dart';

Future<List<dynamic>> getDataUser() async {
  var url = Uri.parse('http://${ip}//storify/getUser.php');
  var response = await http.get(url);
  
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
