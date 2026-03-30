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
      id INTEGER PRIMARY KEY AUTOINCREMENT ,
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

  Future<List<Map<String,dynamic>>>selectTask() async{
    final dbClient = await db;
    return  await dbClient.query("Tasks");


  }
  Future<void> deleteTask(int id) async {
    final dbClinet = await db ;
    dbClinet.delete("Tasks", where: "id=?",whereArgs: [id]);

  }

  Future<void> updateTask(Map<String,dynamic> data ) async{
    final dbClient = await db ;
    dbClient.update("Tasks", data,where:"id=?", whereArgs: data["id"]);
  }




}