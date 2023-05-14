import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class PenerimaanPage extends StatefulWidget {
  const PenerimaanPage({Key? key}) : super(key: key);

  @override
  _PenerimaanPageState createState() => _PenerimaanPageState();
}

class _PenerimaanPageState extends State<PenerimaanPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TextEditingController _descriptionController = TextEditingController();
  List<Barang> _barangList = [
    Barang(id: 1, kode: 'BRG001', nama: 'Barang 1'),
    Barang(id: 2, kode: 'BRG002', nama: 'Barang 2'),
    Barang(id: 3, kode: 'BRG003', nama: 'Barang 3'),
  ];
  List<Supplier> _supplierList = [
    Supplier(id: 1, nama: 'Supplier A'),
    Supplier(id: 2, nama: 'Supplier B'),
    Supplier(id: 3, nama: 'Supplier C'),
  ];
  int? _selectedBarang;
  int? _selectedSupplier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Penerimaan Barang', style: TextStyle(fontSize: 16, fontFamily: 'Futura', fontWeight: FontWeight.bold),),
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
                              style: TextStyle(fontSize: 12, fontFamily: 'Futura')
                            ),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                      ),
                    ),
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
                              child: Text(barang.kode, style: TextStyle(fontSize: 12, fontFamily: 'Futura')),
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
                          value: _selectedSupplier,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Nama Supplier',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          items: _supplierList.map((supplier) {
                            return DropdownMenuItem(
                              value: supplier.id,
                              child: Text(supplier.nama, style: TextStyle(fontSize: 12, fontFamily: 'Futura')),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedSupplier = value;
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
                      child: Text('Simpan', style: TextStyle(fontSize: 16, fontFamily: 'Futura', fontWeight: FontWeight.bold)),
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

class Supplier {
  final int id;
  final String nama;

  Supplier({required this.id, required this.nama});
}
