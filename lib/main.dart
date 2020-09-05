import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiket/halaman_depan/halaman_depan.dart';
import './detail.dart';
import 'add_data.dart';

// void main(){
//   runApp(MaterialApp(
//     title: 'Tiket',
//     home: Home(),
//   ));
// }
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanDepan(),
      routes: {
        'home' : (context)=>Home()
      },
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Icon actionIcon = Icon(Icons.refresh);
  Future<List> getData() async {
    final response =
        await http.get("http://ticket.ahmadmuzaki.xyz/getData.php");
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a0ca3),
        title: Text("Data Penumpang Gatrik"),
        // centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //     icon: actionIcon,
        //     onPressed: (){
        //       return Home();
        //     },
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3a0ca3),
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => AddData(),
        )),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          // return Text(list[i]['nama']);
          return Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [
            //     Color(0xff7209b7),
            //     Color(0xff3a0ca3),
            //   ])),
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Detail(
                    list: list,
                    index: i,
                  ),
                ),
              ),
              child: Card(
                color: Color(0xffffffff),
                child: ListTile(
                  title: Text(list[i]['nama']),
                  leading: Icon(Icons.widgets),
                  subtitle: Text("Tujuan : ${list[i]['tujuan']}"),
                ),
              ),
            ),
          );
        },
      );
  }
}
