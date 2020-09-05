import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerTujuan = TextEditingController();
  TextEditingController controllerBus = TextEditingController();
  TextEditingController controllerKursi = TextEditingController();

  void addData() {
    var url = "http://ticket.ahmadmuzaki.xyz/tambahdata.php";
    http.post(url, body: {
      "nama": controllerNama.text,
      "tujuan": controllerTujuan.text,
      "bus": controllerBus.text,
      "kursi": controllerKursi.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3a0ca3),
        title: Text("Add Data"),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [
        //       Color(0xff7209b7),
        //       Color(0xff3a0ca3),
        //     ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10),),
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff3a0ca3)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4cc9f0)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // filled: true,
                    // fillColor: Colors.white,
                    // focusColor: Colors.white,
                    // hintStyle: TextStyle(color: Colors.blue),
                    // labelStyle: TextStyle(color: Colors.blue)
                    hintText: "Masukkan Nama",
                    labelText: "Nama",
                    prefixIcon: Icon(Icons.account_circle)
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                TextField(
                  controller: controllerTujuan,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff3a0ca3)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4cc9f0)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Tujuan Keberangkatan",
                    labelText: "Tujuan",
                    prefixIcon: Icon(Icons.location_on)
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                TextField(
                  controller: controllerBus,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff3a0ca3)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4cc9f0)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Nama Bus",
                    labelText: "Bus",
                    prefixIcon: Icon(Icons.airport_shuttle)
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                TextField(
                  controller: controllerKursi,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff3a0ca3)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4cc9f0)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Nomor Kursi",
                    labelText: "Nomor Kursi",
                    prefixIcon: Icon(Icons.book)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                RaisedButton(
                  child: Text("Tambah Data"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  color: Color(0xff3a0ca3),
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
