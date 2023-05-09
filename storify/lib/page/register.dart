import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _selectedRole;

  List<String> _roles = ['Staff', 'Admin', 'Kepala Gudang'];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            DropdownButtonFormField(
              value: _selectedRole,
              decoration: InputDecoration(
                labelText: 'Jabatan',
              ),
              items: _roles.map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (selectedRole) {
                setState(() {
                  _selectedRole = selectedRole!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Fungsi yang dijalankan saat tombol ditekan
              },
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
