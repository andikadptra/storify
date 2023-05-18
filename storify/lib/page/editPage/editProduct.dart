import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:storify/utilitas/editData.dart';
import 'package:storify/utilitas/search.dart';
import 'package:storify/utilitas/uploadProduct.dart';
import 'package:intl/intl.dart';
import 'package:storify/utilitas/ip.dart';

class EditPage extends StatefulWidget {
  final kodeEdit;
  EditPage({Key? key, required this.kodeEdit}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _textEditingController = TextEditingController();

  List<Map<String, dynamic>> _data = [];
  TextEditingController _namabarangcontroller = TextEditingController();
  TextEditingController _kodejeniscontroller = TextEditingController();
  TextEditingController _hargacontroller = TextEditingController();
  TextEditingController _stokcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _namaBarang, _kodeJenisBarang;
  int? _harga, _stok;
  String selectedItem = 'baju';
  String pilihan = '';
  int pilihanIndex = 1;
  String folderName = '';

  final ImagePicker picker = ImagePicker();
  File? _image;

  Future<void> chooseImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> editImage(String kodeBarang, namaBarang, kodeJenisBarang, harga, stok, deskripsi) async {
  final namaProduk = 'iniIMG';

  final uri = Uri.parse("http://${ip}//storify/uploadProduct.php");
  var request = http.MultipartRequest('POST', uri);
  var pic = await http.MultipartFile.fromPath("image", _image!.path);
  request.files.add(pic);
  var response = await request.send();

  if (response.statusCode == 200) {
    var imageUrl = await response.stream.bytesToString();
    print('Image edited: $imageUrl');

    editData(kodeBarang, namaBarang, kodeJenisBarang, harga, stok, deskripsi, imageUrl)
    .then((_) => print('Data edited'))
    .catchError((error) => print('Error: $error'));
  } else {
    print('Image not edited');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Produk'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      controller: _namabarangcontroller,
                      decoration: InputDecoration(
                        labelText: 'Nama Barang',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama barang tidak boleh kosong';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _namaBarang = value!;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Text('Kategori : '),
                        DropdownButton<String>(
                          value: selectedItem,
                          items: [
                            DropdownMenuItem(
                              child: Text('Baju'),
                              value: 'baju',
                            ),
                            DropdownMenuItem(
                              child: Text('Celana'),
                              value: 'celana',
                            ),
                            DropdownMenuItem(
                              child: Text('Sepatu'),
                              value: 'sepatu',
                            ),
                          ],
                          onChanged: (String? value) {
                            pilihan = value.toString();
                            setState(() {
                              selectedItem = value ??
                                  'baju'; // jika value null, tetap gunakan nilai default baju
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _hargacontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Harga',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harga tidak boleh kosong';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _harga = int.parse(value!);
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _stokcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Stok',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Stok tidak boleh kosong';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _stok = int.parse(value!);
                      },
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: chooseImage,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: _image == null
                            ? Center(
                                child: Text('Pilih Gambar'),
                              )
                            : Image.file(_image!, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            final data = await DataFetcher.fetchData();
                            setState(() {
                              _data = data;
                            });
                          } catch (error) {
                            print(error);
                          }
                          int indexbarang = 0;
                          if (_data.isEmpty) {
                            indexbarang = 0;
                          } else {}

                          switch (pilihan) {
                            case 'sepatu':
                              pilihanIndex = 1;
                              break;
                            case 'baju':
                              pilihanIndex = 2;
                              break;
                            case 'celana':
                              pilihanIndex = 3;
                              break;
                            default:
                          }


                          // final barang = Barang(
                          //   kodeBarang: indexbarang.toString(),
                          //   namaBarang: _namabarangcontroller.text,
                          //   kodeJenisBarang: pilihanIndex.toString(),
                          //   harga: int.parse(_hargacontroller.text),
                          //   stok: int.parse(_stokcontroller.text),
                          // );
                          editImage(widget.kodeEdit.toString(),  _namabarangcontroller.text, pilihanIndex.toString(), _hargacontroller.text, _stokcontroller.text, 'deskripsi');
                        },
                        child: Text('Simpan'))
                  ],
                ))));
  }
}
