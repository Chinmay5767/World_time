import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:world_time/services/world_time_api.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    // wait until we get time data
    // Navigate to home screen
    Navigator.pop(context ,{         // no need to use argument to give data to home screen becaouse we are just popping and not replacing
    'location': instance.location,
    'flag': instance.flag,
    'time':instance.time,
    'isDayTime': instance.isDayTime,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Choose Location"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        elevation: 0,

      ),
      body: ListView.builder(

        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 2.0),
            child: Card(
              color: Colors.yellowAccent,
              child: ListTile(
                onTap: (){
                   updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),//locations is name of list and location is its property
              ),
            ),
          );
        }
      )
    );
  }
}
