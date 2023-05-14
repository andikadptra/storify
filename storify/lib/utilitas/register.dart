import 'dart:convert';

import 'package:http/http.dart' as http;

class DataSenderReg {
  static const String apiUrl = 'http://192.168.2.124/storify';

  static Future<bool> sendData(String namaUser, String username, String password, String levelAkses) async {
    final url = '$apiUrl/addUser.php';
    final response = await http.post(Uri.parse(url), body: {
      'nama_user': namaUser,
      'username': username,
      'password': password,
      'level_akses': levelAkses,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['success'] == true;
    } else {
      throw Exception('Failed to send data');
    }
  }
}
