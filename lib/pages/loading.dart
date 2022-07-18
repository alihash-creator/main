import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';
import 'package:time/services/World_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {




    void setupWorldtime() async {
    // Worldtime instance  = Worldtime(location: 'Berlin', flag: "ger.png", url:'Europe/berlin');
      
      
      

    Worldtime worldtime = Worldtime(location: 'Berlin', flag: 'ger.png', url: 'Europe/berlin');
    await worldtime.getTime();
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': worldtime.location,
      'time': worldtime.time,
      'flag': worldtime.flag,
      'isDaytime': worldtime.isDaytime,

    });





  }

  @override
  void initState() {

    super.initState();
    setupWorldtime();


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitRotatingCircle(
          size: 50.0,
          color: Colors.white,
        ),

      )
    );
  }
}
