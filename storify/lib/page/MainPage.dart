import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storify/page/addPage/addBarang.dart';
import 'package:storify/page/addPage/addPenerimaanBarang.dart';
import 'package:storify/page/addPage/addPengambilanBarang.dart';
import 'package:storify/page/addPage/addStaf.dart';
import 'package:storify/page/addPage/addSupplier.dart';
import 'package:storify/page/searchPage.dart';
import 'package:storify/page/subPage/laporanPage.dart';
import 'package:storify/page/subPage/pemantauanBarang.dart';
import 'package:storify/page/subPage/userPage.dart';
import 'package:storify/utilitas/fungsiSearch.dart';
import 'package:storify/utilitas/search.dart';
import 'package:http/http.dart' as http;
import 'package:storify/utilitas/getData.dart';

class MainPage extends StatefulWidget {
  final level, id, username;
  MainPage({super.key, required this.level, required this.id, required this.username});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchController = TextEditingController();

  Future<void> fetchData() async {
  try {
    List<dynamic> userData = await getDataUser();
  } catch (e) {
    print('Error: $e');
  }
}
  

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size size = MediaQuery.of(context).size;
    // Menghitung tinggi layar tanpa padding atas
    final double height = size.height - MediaQuery.of(context).padding.top;
    // Mendapatkan lebar layar
    final double width = size.width;

    final List<String> _itemsStaff = [
      'Barang',
      'Pengambilan Barang',
      'Penerimaan Barang',
      'Penyimpanan Barang'
    ];

    final List<String> _itemsAdmin = ['Staff', 'Supplier'];

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Color(0xFFF1F6F9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: searchController,
                                style: TextStyle(
                                  fontFamily: 'Futura',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20.0,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () async {
                                      // final List<Barang> result = await DataFetcher.fetchData(searchController.text);
                                      // action when search icon is pressed
                                      final data =
                                          await DataFetcher.fetchData();
                                      print('data :  ${data}');

                                      String keyword = searchController.text;
                                      List<Map<String, dynamic>> searchResult =
                                          fungsisearch(data, keyword);

                                      print(searchResult);

                                      List<String> kodeBarangList = [];

                                      for (var barang in searchResult) {
                                        String kodeBarang = barang['Kode_barang'];
                                        kodeBarangList.add(kodeBarang);
                                      }

                                      print(kodeBarangList);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage(searchData: searchResult, id: kodeBarangList)));
                                    },
                                    icon: Icon(Icons.search),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserPage()));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFF9BA4B5),
                            radius: 40.0,
                            // backgroundImage: AssetImage('assets/images/user.png'),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                  fontFamily: 'Futura',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.username,
                                style: TextStyle(
                                  fontFamily: 'Futura',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.level,
                                style: TextStyle(
                                  fontFamily: 'Futura',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 35, bottom: 10),
                    child: Container(
                      width: width,
                      height: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  LaporanPage())));
                                    },
                                    child: Container(
                                      width: width / 2 - 6,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Laporan',
                                              style: TextStyle(
                                                  fontFamily: 'Futura',
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PantauPage()));
                                    },
                                    child: Container(
                                      width: width / 2 - 6,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Pemantauan',
                                              style: TextStyle(
                                                  fontFamily: 'Futura',
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    width: width / 2 - 6,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    width: width / 2 - 6,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF9BA4B5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F6F9),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0xFF9BA4B5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {
                              showDropdown(
                                  context,
                                  widget.level == 'admin'
                                      ? _itemsAdmin
                                      : _itemsStaff);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showDropdown(BuildContext context, List<String> items) {
  final RenderBox button = context.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(Offset.zero, ancestor: overlay),
      button.localToGlobal(button.size.bottomLeft(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: items.length == 2 ? 110 : 250,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: GestureDetector(
                  onTap: () {
                    switch (items[index].toLowerCase()) {
                      case 'supplier':
                        print('supplier');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SupplierPage(condition: 'add')));
                        break;
                      case 'staff':
                        print('staff');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StaffPage(condition: 'add')));
                        break;
                      case 'barang':
                        print('barang');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BarangPage(condition: 'add')));
                        break;
                      case 'pengambilan barang':
                        print('pengambilan barang');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PengambilanPage()));
                        break;
                      case 'penerimaan barang':
                        print('penerimaan barang');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PenerimaanPage()));
                        break;
                      case 'penyimpanan barang':
                        print('penyimpanan barang');
                        break;
                      default:
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFB1B1B1),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 2,
                        //     blurRadius: 5,
                        //     offset: Offset(0, 3),
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          items[index],
                          style: TextStyle(fontSize: 16, fontFamily: 'Futura'),
                        ),
                      ))),
              onTap: () {
                Navigator.pop(context);
                // do something when item is tapped
              },
            );
          },
        ),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    barrierColor: Colors.black54,
    elevation: 5,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}
