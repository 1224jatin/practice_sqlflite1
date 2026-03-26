import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{
  TextEditingController taskNamecontroller = TextEditingController();
  TextEditingController taskDecriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(body:
     Center(child:
       Column(mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Card( color:  Colors.blueGrey,
         child: TextField(
           controller: taskNamecontroller,
           decoration: InputDecoration(
             label: const Text("TASK NAME"),
             hintText: "gym"
           ),
         ),

         ),
         Card(

         )
       ],
       ),

     ),
   );
  }

}