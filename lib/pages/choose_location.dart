import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  int counter=0;
  void getData() async {
    Response response =await get('https://jsonplaceholder.typicode.com/todos/1');
  }
  void initState() {
    print("funtion ran");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("Build ran");
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Center(
       child: ElevatedButton(
         onPressed:() {
           setState(() {
             counter+=1;
           });
         }, child:Text('counter is $counter'),
       ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Choose location"),
        centerTitle: true,
      ),
    );
  }
}
