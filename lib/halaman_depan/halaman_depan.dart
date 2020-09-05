import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tiket/main.dart';

class HalamanDepan extends StatefulWidget {
  @override
  _HalamanDepanState createState() => _HalamanDepanState();
}

class _HalamanDepanState extends State<HalamanDepan> {
  @override
  void initState(){
    super.initState();
    startMain();
  }
  startMain() async{
    var duration = const Duration(seconds: 2);
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
        return Home();
      }));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(0xff7209b7),
              Color(0xff3a0ca3),
            ])),
        child: Center(
          child: Image.asset(
            "assets/images/gatrik.png",
            height: 150,
          ),
        ),
      ),
    );
  }
}
