import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/model.dart';

class DbHelper {
  static Database? _db;

  Future<DatabaseExecutor> get db async{
if (_db != null ){
  return _db! ;
}
 _db = await initDB();
return _db!;

  }
  initDB() async{
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(path,
    version: 1,
    onCreate: (db,version) async {
     await db.execute( '''CREATE TABLE Tasks(
      ID INTEGER PRIMARY KEY AUTOINCREMENT ,
      taskName TEXT NOT NULL,
      taskDescription TEXT NOT NULL
      );''');
    }
    );
  }

  Future<void> insertTask(Task task) async {
    final dbClient = await db;
    dbClient.insert("Tasks", task.ToMap(task));
  }

  Future<List<Task>>selectTask() async{
    final dbClient = await db;
    final List<Map<String,dynamic>> maps = await dbClient.query("Tasks");
    return maps.map((e)=> Task.fromMap(e)).toList();

  }



}