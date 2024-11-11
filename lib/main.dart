import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_api/Models/todolistmodel.dart';
import 'package:todolist_with_api/Providers/todolistprovider.dart';

import 'Screens/todolist.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => ToDoListProvider(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todolist(),
    );
  }
}
