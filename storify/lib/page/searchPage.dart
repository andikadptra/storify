import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:storify/page/subPage/detailItem.dart';
import 'package:storify/utilitas/database.dart';
import 'package:storify/utilitas/search.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  late List<Map<String, dynamic>> searchData;
  late List<String> id;
  SearchPage({super.key, required this.searchData, required this.id});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> searchItems = [];
  late String imageUrl = "";

  @override
  void initState() {
    super.initState();
    searchItems = widget.searchData;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 10),
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
                                      // action when search icon is pressed

                                      final data =
                                          await DataFetcher.fetchData();
                                      if (data.isEmpty) {
                                        print('kosong');
                                      } else {
                                        print(data);
                                      }
                                    },
                                    icon: Icon(Icons.search),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: AppBar().preferredSize.height - 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GridView.builder(
                      itemCount: searchItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print(searchItems[index]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailItem(
                                    deskripsi: searchItems[index]['deskripsi'],
                                      image: searchItems[index]['image'],
                                      id: searchItems[index]['Kode_barang'],
                                      productName: searchItems[index]
                                          ['Nama_barang'],
                                      stok: searchItems[index]['Stok'],
                                      harga: searchItems[index]['Harga']),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image: NetworkImage(searchItems[index]['image']),
                                        fit: BoxFit.scaleDown,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          searchItems[index]['Nama_barang'],
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          "Stok: ${searchItems[index]['Stok']}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer();
}
