import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data ={};


  @override
  Widget build(BuildContext context) {
  data= data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
 // we get data from choose location or loading screen here
// we could use isNotEmpty function because it is map
    // if data variable is empty it will give data from  loading page means first data or otherwise it will update data from choose location page
  String bgImage= data['isDayTime']? 'day.jpeg':'night.jpeg';
  Color iscolor=data['isDayTime']? Colors.black:Colors.white;
  Color bgcolor=data['isDayTime']? Colors.blueAccent:Colors.black38;

    return Scaffold(
       backgroundColor: bgcolor,
      body: SafeArea(

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
              fit: BoxFit.fill,

            )
          ),





          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton.icon(
              onPressed: () async {
               dynamic result= await Navigator.pushNamed(context, '/location');
               setState(() {
                 data ={
                   'time': result['time'],
                   'location': result['location'],
                   'isDayTime': result['isDayTime'],
                   'flag': result['flag'],
                 };
               });

              },
              icon: Icon(
                Icons.edit_location_alt,
                size: 24,
                color: iscolor,

              ),
              label: Text("edit location",
            style: TextStyle(
              color: iscolor,
            ), ),





            ),SizedBox(height: 25.0),
              Row(  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],
                  style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                   fontWeight: FontWeight.bold,
                    color: iscolor,
                  ),),

                ],
              ),
              SizedBox(height: 25.0),
              Text(data['time'],
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: iscolor,
              ),)

            ],
          ),
        )


      ),

    );
  }
}
