import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PengambilanPage extends StatefulWidget {
  const PengambilanPage({Key? key}) : super(key: key);

  @override
  _PengambilanPageState createState() => _PengambilanPageState();
}

class _PengambilanPageState extends State<PengambilanPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TextEditingController _descriptionController = TextEditingController();
  List<Barang> _barangList = [
    Barang(id: 1, kode: 'BRG001', nama: 'Barang 1'),
    Barang(id: 2, kode: 'BRG002', nama: 'Barang 2'),
    Barang(id: 3, kode: 'BRG003', nama: 'Barang 3'),
  ];
  List<Pelanggan> _PelangganList = [
    Pelanggan(id: 1, nama: 'Pelanggan A'),
    Pelanggan(id: 2, nama: 'Pelanggan B'),
    Pelanggan(id: 3, nama: 'Pelanggan C'),
  ];
  int? _selectedBarang;
  int? _selectedPelanggan;
  int _jumlahBarang = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Penerimaan Barang',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Futura', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF1F6F9),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime.now(),
                        onChanged: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                        onConfirm: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                        currentTime: _selectedDate,
                        locale: LocaleType.id,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                style: TextStyle(
                                    fontSize: 12, fontFamily: 'Futura')),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
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
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Deskripsi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    maxLines: null,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Deskripsi harus diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 16.0),
                        DropdownButtonFormField(
                          value: _selectedBarang,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Kode Barang',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          items: _barangList.map((barang) {
                            return DropdownMenuItem(
                              value: barang.id,
                              child: Text(barang.kode,
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: 'Futura')),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedBarang = value;
                            });
                          },
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField(
                          value: _selectedPelanggan,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Nama Pelanggan',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          items: _PelangganList.map((Pelanggan) {
                            return DropdownMenuItem(
                              value: Pelanggan.id,
                              child: Text(Pelanggan.nama,
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: 'Futura')),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPelanggan = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF394867)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // simpan data staff ke database atau melakukan tindakan lainnya
                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Simpan',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Barang {
  final int id;
  final String kode;
  final String nama;

  Barang({required this.id, required this.kode, required this.nama});
}

class Pelanggan {
  final int id;
  final String nama;

  Pelanggan({required this.id, required this.nama});
}
