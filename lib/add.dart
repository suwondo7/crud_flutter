import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  void addData() {
    var url = Uri.parse("https://coba.xyz/mystore/adddata.php");
    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ADD DATA",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controllerCode,
                decoration: const InputDecoration(
                    hintText: "Item Code", labelText: "Item Code"),
              ),
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(
                    hintText: "Item Name", labelText: "Item Name"),
              ),
              TextField(
                controller: controllerPrice,
                decoration: const InputDecoration(
                    hintText: "Price", labelText: "Price"),
              ),
              TextField(
                controller: controllerStock,
                decoration: const InputDecoration(
                    hintText: "Stock", labelText: "Stock"),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      addData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      ).then((value) => setState(() {}));
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18))),
                    label: const Text(
                      "ADD DATA",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18))),
                    label: const Text(
                      "KEMBALI",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
