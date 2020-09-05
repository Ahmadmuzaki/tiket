import 'package:flutter/material.dart';
import 'editdata.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deleteData(){
    var url="http://ticket.ahmadmuzaki.xyz/deleteData.php";
    http.post(url, body:{
      'id' : widget.list[widget.index]['id'],
    });
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Apakah yakin menghapus data ini? '${widget.list[widget.index]['nama']}'"),
      // content: Text("Apakah yakin menghapus data ini? '${widget.list[widget.index]['nama']}'")
      actions: <Widget>[
        RaisedButton(
          child: Text("HAPUS"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xfff72585),
          textColor: Colors.white,
          // onPressed: () {
          //   deleteData();
          // },
          onPressed: (){
            deleteData();
            Navigator.of(context).pushNamedAndRemoveUntil('home', (Route<dynamic>route)=>false);
          },
        ),
        RaisedButton(
          child: Text("BATAL"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xff4cc9f0),
          textColor: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
    showDialog(context: context, 
    builder: (BuildContext context){
      return alertDialog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['nama']}"),
        backgroundColor: Color(0xff3a0ca3),
      ),
      body: Container(
        height: 250,
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Text(
                  widget.list[widget.index]['nama'],
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Tujuan : ${widget.list[widget.index]['tujuan']}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Bus : ${widget.list[widget.index]['bus']}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Nomor Kursi : ${widget.list[widget.index]['kursi']}",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                // Row(
                //   children: <Widget>[
                //     Expanded(
                //       child: Container(
                //         height: 50,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(50),
                //             color: Colors.lightGreen),
                //         child: Center(
                //             child: Text(
                //           "EDIT",
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         )),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Expanded(
                //       child: Container(
                //         height: 50,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(50),
                //             color: Colors.redAccent),
                //         child: Center(
                //             child: Text(
                //           "DELETE",
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         )),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "EDIT",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xff4361ee),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EditData(widget.list, widget.index)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    RaisedButton(
                      child: Text(
                        "PRINT",
                        style: TextStyle(color: Colors.white),
                      ),
                      // Color(0xff264653),
                      // Color(0xff2a9d8f)
                      color: Color(0xff4cc9f0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    RaisedButton(
                      child: Text(
                        "HAPUS",
                        style: TextStyle(color: Colors.white),
                      ),
                      // Color(0xff264653),
                      // Color(0xff2a9d8f)
                      color: Color(0xfff72585),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () => confirm(),
                    ),
                    // IconButton(
                    //   onPressed: (){},
                    //   icon: Icon(Icons.edit),
                    // )
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
