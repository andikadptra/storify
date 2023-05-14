import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storify/utilitas/deleteData.dart';

class DetailItem extends StatefulWidget {
  String productName, stok, harga, id;

  DetailItem({super.key, required this.productName, required this.stok, required this.harga, required this.id});

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size size = MediaQuery.of(context).size;
    // Menghitung tinggi layar tanpa padding atas
    final double height = size.height - MediaQuery.of(context).padding.top;
    // Mendapatkan lebar layar
    final double width = size.width;

    int maxLines = 10;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showConfirmationPopup(context);
      }),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new_rounded)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Product',
                        style: TextStyle(
                            fontFamily: 'Future',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 350,
                          height: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 350 / 2,
                                    child: Text(
                                      '${widget.productName}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Futura'),
                                    ),
                                  ),
                                  // Stok Barang
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 35, right: 35, bottom: 5),
                          child: Container(
                            width: width,
                            child: Text(
                              "Info",
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLines,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Futura'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 10, right: 35, bottom: 25),
                          child: Container(
                            width: width,
                            child: Text(
                              'harga : ${widget.harga}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLines,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Futura'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 10, right: 35, bottom: 25),
                          child: Container(
                            width: width,
                            child: Text(
                              'harga : ${widget.stok}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: maxLines,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Futura'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFF1F6F9),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showConfirmationPopup(BuildContext context) {
  // showDialog is a built-in function in Flutter that displays a popup
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete this item?'),
        content: Text('Are you sure you want to delete this item?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              // close the popup and do nothing
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () {
              // close the popup and execute the deleteBarang function
              Navigator.of(context).pop();
              deleteBarang(int.parse(widget.id));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
}
