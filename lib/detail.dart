import 'package:crud_flutter/main.dart';
import 'package:flutter/material.dart';
import 'edit.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({super.key, required this.list, required this.index});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = Uri.parse("https://coba.xyz/mystore/deletedata.php");
    http.post(url, body: {"id": widget.list[widget.index]['id']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.list[widget.index]['item_name']}",
          style: const TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  widget.list[widget.index]['item_name'],
                  style: const TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Code: ${widget.list[widget.index]['item_code']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Code: ${widget.list[widget.index]['price']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Code: ${widget.list[widget.index]['stock']}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => EditData(
                                  list: widget.list,
                                  index: widget.index,
                                )));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 18))),
                      label: const Text(
                        "EDIT",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        AlertDialog alertDialog = AlertDialog(
                          content: Text(
                              "Apakah yakin akan menghapus '${widget.list[widget.index]['item_name']}'"),
                          actions: <Widget>[
                            ElevatedButton.icon(
                              onPressed: () {
                                deleteData();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const Home()));
                              },
                              icon: const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 18))),
                              label: const Text(
                                "Ok",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20)),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(fontSize: 18))),
                              label: const Text(
                                "Batal",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (context) => alertDialog,
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 18))),
                      label: const Text(
                        "HAPUS",
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
