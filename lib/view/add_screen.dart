import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_practice1/db_helper/db_helper.dart';
import 'package:sqlflite_practice1/view/update_screen.dart';
import 'package:sqlflite_practice1/view_model/vm_sql.dart';

import '../model/model.dart';
import 'find_task_screen.dart';

class AddScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddScreen();
}
class _AddScreen extends State<AddScreen>{
  late final vm = Provider.of<VmSql>(context);
  final dbHelper=DbHelper();
  List<Map<String,dynamic>> myTasks= [];
   late TextEditingController updateNameController;
   late TextEditingController updateDesriptionController ;

  @override void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async{
    final data =  await dbHelper.selectTask();
    setState(() {
      myTasks=data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: ListView.builder(itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Card(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // rows for name and discription
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Task Name =  "),
                          Text(myTasks[index]["taskName"])
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Description =  "),
                          Text(myTasks[index]["taskDescription"])
                        ],

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            showDialogbox(context, myTasks[index]);
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateScreen(task: myTasks[index])));

                          }, icon: Icon(Icons.edit_calendar_outlined)),
                          IconButton(onPressed: ()async{
                            final id = myTasks[index]["id"];
                            if(id!= null){
                              await dbHelper.deleteTask(id);
                              loadTasks();
                            }
                          }, icon: Icon(Icons.delete_forever)),
                          
                        ],
                      )


                    ],
                  ),
                ),
              );
            },
              itemCount: myTasks.length,
            )),
            FloatingActionButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FindTaskScreen() ));
            },child:Icon(Icons.broken_image_outlined) ,)

          ],
        ));

  }

   void showDialogbox(BuildContext context,Map<String,dynamic> task){
     updateNameController = TextEditingController();
     updateDesriptionController = TextEditingController();

    showDialog(context: context, builder: (context){
      return AlertDialog(
        // title
        title: const Text("Update Information "),
        // content
        content: Column(
          children: [
            TextField(
              controller: updateNameController,
              decoration: InputDecoration(
                  label: const Text("Name")
              ),
            ),
            TextField(
              controller: updateDesriptionController,
              decoration: InputDecoration(
                  label: const Text("Description")
              ),
            ),
          ],
        ),
        //buttons
        actions:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // update button
              ElevatedButton(onPressed: (){
                dbHelper.updateTask({
                  "id":task["id"],
                  "taskName":updateNameController.text,
                  "taskDescription":updateDesriptionController.text
                });
                Navigator.of(context).pop();
                loadTasks();

              }, child: const Text("update")),
              // no button
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              },child: const Text("No"))
            ],
          )
        ],
      );
    });
    }
    }
