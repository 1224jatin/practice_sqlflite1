import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_practice1/model/model.dart';
import 'package:sqlflite_practice1/view/add_screen.dart';
import 'package:sqlflite_practice1/view_model/vm_sql.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{
  TextEditingController taskNamecontroller = TextEditingController();
  TextEditingController taskDecriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VmSql>(context);
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
         SizedBox(height: 10),
         Card(
           color: Colors.blue,
           child: TextField(
             controller: taskDecriptioncontroller,
             decoration:  InputDecoration(
               label: const Text("Task Discription"),
             ),
           ),
         ),
         ElevatedButton(onPressed: (){
           if(taskNamecontroller.text != null &&
               taskDecriptioncontroller.text != null){
             setState(() {
               vm.addTask(
                 Task(taskName:taskNamecontroller.text, taskDescription: taskDecriptioncontroller.text)
               );
             });
             Navigator.push(context,
                 MaterialPageRoute(builder: (context)=> AddScreen()));
           }
         }, child: const Text("submit"))
       ],
       ),

     ),
   );
  }

}