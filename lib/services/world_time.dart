import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Worldtime {

   late String location;
  late  String time;
   late String flag;
  late  String url ;
   bool? isDaytime ;









  Future getTime() async {
    // Future<http.Response> fetchAlbum() {
    //   return http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // }

      Response response = await  get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data =jsonDecode(response.body);

     String datetime =data ['datetime'];
      String offset = data ['utc_offset'].substring(1,3);


      DateTime date = DateTime.parse(datetime);
      date = date.add(Duration(hours: int.parse(offset)));

       isDaytime = date.hour > 6 && date.hour < 20 ? true : false;
       time = DateFormat.jm().format(date);




  }



   Worldtime({required this.location, required this.flag, required this.url});
}
