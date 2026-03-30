import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqlflite_practice1/view/bottomNavigationBar.dart';
import 'package:sqlflite_practice1/view/home_Screen.dart';
import 'package:sqlflite_practice1/view_model/vm_sql.dart';

void main() async {
runApp(
  ChangeNotifierProvider(
      create: (context)=> VmSql(),
    child: const MyApp(),
  )
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  Bottomnavigationbar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Task MVVM second"),
      ),
      body: Center(

      ),

    );
  }
}
