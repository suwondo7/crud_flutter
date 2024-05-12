import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  const EditData({super.key, required this.list, required this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;
  @override
  void initState() {
    // TODO: implement initState
    controllerCode =
        TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  void editData() {
    var url = Uri.parse("https://coba.xyz/mystore/editdata.php");
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
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
            "EDIT DATA",
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
                      editData();
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
                      "EDIT DATA",
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
