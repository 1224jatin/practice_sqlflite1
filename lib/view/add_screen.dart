import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_practice1/db_helper/db_helper.dart';
import 'package:sqlflite_practice1/view_model/vm_sql.dart';

import '../model/model.dart';

class AddScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddScreen();
}
class _AddScreen extends State<AddScreen>{
  late final vm = Provider.of<VmSql>(context);
  final dbHelper=DbHelper();
  List<Task> myTasks= [];

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
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
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
                          const Text("task Name"),
                          Text(myTasks[index].taskName)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Description"),
                          Text(myTasks[index].taskDescription)
                        ],

                      )
                    ],
                  ),

                ),
              );

            },
              itemCount: myTasks.length,
            ))

          ],
        ));

  }

}