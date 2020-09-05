import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {

  final List list;
  final int index;

  EditData(this.list, this.index);
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {


  TextEditingController controllerNama;
  TextEditingController controllerTujuan;
  TextEditingController controllerBus;
  TextEditingController controllerKursi; 

  void editData(){
    var url="http://ticket.ahmadmuzaki.xyz/editdata.php";
    http.post(url, body: {
      "id" : widget.list[widget.index]['id'],
      "nama":controllerNama.text,
      "tujuan":controllerTujuan.text,
      "bus":controllerBus.text,
      "kursi":controllerKursi.text,
    });
  }

  @override
  void initState() {
    controllerNama = TextEditingController(text: widget.list[widget.index]['nama']);
      controllerTujuan = TextEditingController(text: widget.list[widget.index]['tujuan']);
      controllerBus = TextEditingController(text: widget.list[widget.index]['bus']);
      controllerKursi = TextEditingController(text: widget.list[widget.index]['kursi']);
    super.initState();
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data Penumpang"),
        backgroundColor: Color(0xff3a0ca3),
      ),
      body: Padding(
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
                  hintText: "Masukkan Nama",
                  labelText: "Nama",
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
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Text("Edit Data"),
                textColor: Colors.white,
                color: Color(0xff3a0ca3),
                onPressed: () {
                  editData();
                  Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic>route)=>false);
                  // Navigator.of(context).popUntil((route)=>route.isFirst);
                }
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class PesanZaki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Balas Pesan Dewi"),
      ),
      body: Center(
        child: Text("Gak Nitip Salam"),
      ),
    );
  }
}