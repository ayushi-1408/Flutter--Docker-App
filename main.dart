import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}
 web(mycmd) async{
   var url= "http://192.168.29.55/cgi-bin/date.py?x=${mycmd}";
   var response= await http.get(url);
   print(response.body);
 }
      
class MyApp extends StatelessWidget {
  String command;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Input App"),
        ),
  body: Center(
  child:Container(
    width:300,
    color: Colors.green,
    height: 300,
    child: Column(
      children: <Widget>[
        TextField(
          onChanged: (value){
            command= value;
          },
          autocorrect: false,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "enter your command",
            prefixIcon: Icon(Icons.search),
          ),
        ),
        FlatButton(onPressed: (){
          web(command);
          
        }, child: Text("click me"),
        color: Colors.amber,),
      ],
    ),
  ),
    )));
  }
}