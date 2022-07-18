import 'package:flutter/material.dart';
import 'package:time/pages/choose_location.dart';
import 'package:time/pages/home.dart';
import 'package:time/pages/loading.dart';

void main() => runApp(MaterialApp(

    initialRoute: '/',
    routes: {
     '/': (context) => Loading(),
     '/Home': (context) => Home(),
     '/Location': (context) => Chooselocation(),


    },
  ));


