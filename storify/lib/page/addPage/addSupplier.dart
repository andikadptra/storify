import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  final condition;
  SupplierPage({Key? key, required this.condition}) : super(key: key);

  @override
  _SupplierPageState createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  final _formKey = GlobalKey<FormState>();
  String _namaSupplier = '';
  String _alamat = '';
  String _noTelepon = '';
  String _kodeBarang = '';
  int _jumlahBarang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.condition == 'add' ? 'Tambah Supplier' : 'Edit Supplier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Supplier',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Supplier harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _namaSupplier = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _alamat = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'No Telepon',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No Telepon harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _noTelepon = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Kode Barang',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kode Barang harus diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  _kodeBarang = value!;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Jumlah Barang',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah Barang harus diisi';
                  }
                  final n = int.tryParse(value);
                  if (n == null || n <= 0) {
                    return 'Jumlah Barang harus lebih besar dari 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  _jumlahBarang = int.parse(value!);
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: submit form data to server or database
                  }
                },
                child: Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF394867),
                  onPrimary: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
