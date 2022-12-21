import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldTime{
    late String location;
    late String time;
    late String flag;
    late String url;
   late bool isDayTime ;
     WorldTime ({ required this.location, required this.flag, required this.url});
    Future <void> getTime() async {
      var response =await http.get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      var data=jsonDecode(response.body) as Map;
      //  print(data);
      String Datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1,3);
      String offset2 = data['utc_offset'].substring(4,6);
      print(Datetime.substring(12,16));
      DateTime now =DateTime.parse(Datetime);
      now =now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
        isDayTime =now.hour>6 && now.hour <20 ? true: false;

     time=DateFormat.jm().format(now);



    }

}