import 'package:flutter/material.dart';
import 'package:time/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  const Chooselocation({Key? key}) : super(key: key);


  @override
  State<Chooselocation> createState() => _ChooselocationState();
}




class _ChooselocationState extends State<Chooselocation> {



  List<Worldtime> locations = [
    Worldtime(location: 'London', flag: 'London.png', url: 'Europe/London'),
    Worldtime(location: 'Rome', flag: 'Rome.png', url: 'Europe/Rome'),
    Worldtime(location: 'Liverpool', flag: 'Lo.png', url: 'Europe/Liverpool'),


  ];


  void updateTime(index) async{
    Worldtime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,

    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Choose Location ") ,
        backgroundColor: Colors.blueAccent,
      ),

      body: ListView.builder(
        itemCount: locations.length,

          itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
            ),

          );
              }



      )
      );

  }
}

