import 'package:flutter/cupertino.dart';
import 'package:sqlflite_practice1/db_helper/db_helper.dart';
import 'package:sqlflite_practice1/model/model.dart';

class VmSql extends ChangeNotifier{
  final dbHelper = DbHelper();

  void addTask (Task task){
    dbHelper.insertTask(task);
    notifyListeners();

  }

}