import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_practice1/db_helper/db_helper.dart';
import 'package:sqlflite_practice1/model/model.dart';
import 'package:sqlflite_practice1/view_model/vm_sql.dart';

class FindTaskScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FindTaskScreen();
}

class _FindTaskScreen extends State<FindTaskScreen>{

  late final vm = Provider.of<VmSql>(context);
   final dbHelper = DbHelper();
   List<Map<String,dynamic>> gymTasks = [];


  @override
  void initState(){
    super.initState();
    loadGymtasks();
  }
  void loadGymtasks() async {
    final data = await dbHelper.findTask();
    setState(() {
      gymTasks= data;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(
              child: ListView.builder(itemBuilder: (context,index){
            return Container(
              height: 300,
              width: 600,
              child: Card(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Task Name = "),
                        Text(gymTasks[index]["taskName"])
                        
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Description"),
                        Text(gymTasks[index]["taskDescription"])
                        
                      ],
                    )
                  ],
                  
                )
              ),
            );

          },
                itemCount: gymTasks.length,

          )
          )
          ],
        ),
      ),
    );
  }

}