import 'package:flutter/material.dart';
import '../widgets/home_buttom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        title: Text(
          'Lacak Orderan',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xff38A3A5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Cek Orderanmu...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, size: 30, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xff22577A),
                  ),
                  child: GestureDetector(
                onTap: () {
                  // Tambahkan logika ketika tombol ditekan
                },
                child: Text(
                  'Lacak Orderan kamu',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
