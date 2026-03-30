import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_practice1/db_helper/db_helper.dart';
import 'package:sqlflite_practice1/model/model.dart';
import 'package:sqlflite_practice1/view_model/vm_sql.dart';

import 'add_screen.dart';

class UpdateScreen extends StatefulWidget{
  final Map<String,dynamic> task;
  const UpdateScreen({super.key, required this.task});

  @override
  State<StatefulWidget> createState() => _UpdateScreen();
}
class _UpdateScreen extends State<UpdateScreen>{
  final dbhelper = DbHelper();
  late TextEditingController updateNameController ;
  late TextEditingController updateDescriptionController ;
  void initState(){
    super.initState();
    updateNameController = TextEditingController(text: widget.task["taskName"]);
    updateDescriptionController = TextEditingController(text: widget.task["taskDescription"]);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<VmSql>(context);
    return Scaffold(body:
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: updateNameController,
          decoration: InputDecoration(
            label: const Text("Task Name"),
          ),
        ),
        TextField(
          controller: updateDescriptionController,
          decoration: InputDecoration(
            label: const Text("Task Description"),
          ),
        ),
        ElevatedButton(onPressed: (){
          if(updateNameController != null && updateDescriptionController != null ){
            setState(() {
              dbhelper.updateTask({
                "id":widget.task["id"],
                "taskName":updateNameController.text,
                "taskDescription":updateDescriptionController.text
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddScreen()));

            });

          }
        }, child: const Text("Update"))
      ],

    ),

    ),
    );
  }

}