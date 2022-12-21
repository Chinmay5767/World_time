

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading ({Key? key}) : super(key: key);

  @override
  State <Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  Future<void> Setup() async {
    try{
      WorldTime instance= WorldTime (location : 'Kolkata', flag : 'kolkata.png', url : 'Europe/Berlin');
     await instance.getTime();
       Navigator.pushReplacementNamed(context, '/home',arguments: {
         'location': instance.location,
         'flag': instance.flag,
         'time':instance.time,
         'isDayTime': instance.isDayTime,
       }
      );

    }
    catch(e){
      print("caught b error: $e");

    }

  }



  @override


  void initState() {

    super.initState();
    Setup();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
     body: Center(
       child:  SpinKitPouringHourGlass(
         color: Colors.white,
         size: 50.0,
       ),

     )
    );
  }
}


