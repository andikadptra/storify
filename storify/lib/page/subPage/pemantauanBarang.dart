import 'package:flutter/material.dart';

class PantauPage extends StatefulWidget {
  const PantauPage({super.key});

  @override
  State<PantauPage> createState() => _PantauPageState();
}

class _PantauPageState extends State<PantauPage> {
  bool _showContainerA = true;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size size = MediaQuery.of(context).size;
    // Menghitung tinggi layar tanpa padding atas
    final double height = size.height - MediaQuery.of(context).padding.top;
    // Mendapatkan lebar layar
    final double width = size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pemantauan data',
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Switch(
                  value: _showContainerA,
                  onChanged: (value) {
                    setState(() {
                      _showContainerA = value;
                    });
                  },
                ),
              ],
            ),
            _showContainerA ? ContainerA() : ContainerB(),
          ],
        ),
      ),
    );
  }
}

class ContainerA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size size = MediaQuery.of(context).size;
    // Menghitung tinggi layar tanpa padding atas
    final double height = size.height - MediaQuery.of(context).padding.top;
    // Mendapatkan lebar layar
    final double width = size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: FutureBuilder(
          future: Future.delayed(
              Duration(seconds: 2), () => 'Data from Container B'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data!),
              );
            }
            return Center(
              child: Text('Failed to load data'),
            );
          },
        ),
      ),
    );
  }
}

class ContainerB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final Size size = MediaQuery.of(context).size;
    // Menghitung tinggi layar tanpa padding atas
    final double height = size.height - MediaQuery.of(context).padding.top;
    // Mendapatkan lebar layar
    final double width = size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height * 0.9,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: FutureBuilder(
          future: Future.delayed(
              Duration(seconds: 2), () => 'Data from Container B'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data!),
              );
            }
            return Center(
              child: Text('Failed to load data'),
            );
          },
        ),
      ),
    );
  }
}
