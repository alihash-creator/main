import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataa= {};
  @override
  Widget build(BuildContext context) {
     var dataa = ModalRoute.of(context)?.settings.arguments;
    print(dataa);
   var myVariable = {}; dataa as Map;
    String bgImage = dataa!['isDaytime'] ? 'day.png' : 'night.png';

    return  Scaffold(

      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover)
              ),




            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,70,0,0),
              child: Column(

                children: <Widget> [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.pink,
                      size: 24.0,
                    ),
                    label: Text('Elevated Button'), onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/Location');

                      setState(() {
                        myVariable = {
                          'location' = result['location'],
                          'time' = result['time'],

                        } as Map;
                          // 'time'= result['time'],
                          // 'location' = result['location'],
                          // 'isDaytime' = result['isDaytime'],
                          // 'flag' = result['flag'],



                      });

                      }),
                 SizedBox(
                  height: 50,
                 ),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text(
                        dataa!['location'],
                        style: TextStyle(
                          fontSize: 28
                        ),

                      ),

                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    dataa!['time'],
                    style: TextStyle(
                        fontSize: 66
                    ),
                  ),

                ],
              ),
            ),
          )
      )
    );
  }
}
