import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'add.dart';
import 'detail.dart';

void main() {
  runApp(const MaterialApp(
    title: "My Store",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async {
    // Silahkan ganti URL nya sesuai HOST nya
    var url = Uri.parse("https://coba.xyz/mystore/getdata.php");
    final response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("MY STORE",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blue),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const AddData())),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data ?? [])
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  List list;
  // ignore: use_key_in_widget_constructors
  ItemList({required this.list});
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                        list: list,
                        index: i,
                      )),
            ),
            child: Card(
              child: ListTile(
                  title: Text(list[i]['item_name']),
                  leading: const Icon(Icons.widgets),
                  subtitle: Row(
                    children: <Widget>[
                      Text("Code: ${list[i]['item_code']}"),
                      const Padding(padding: EdgeInsets.all(2.0)),
                      Text("Stock: ${list[i]['stock']}"),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
