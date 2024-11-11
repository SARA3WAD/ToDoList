import 'package:flutter/material.dart';
import 'package:todolist_with_api/Models/todolistmodel.dart';
import 'package:todolist_with_api/Services/todolistservice.dart';
//sara
class ToDoListProvider with ChangeNotifier
{
  ToDoListModel? toDoListModel;
  Future<void>getprovider()async{
    toDoListModel = await ToDoListService.getdata();
    notifyListeners();
  }
  Future<void> posttasks(String newtask)async{
    await ToDoListService.addtask(newtask);
    toDoListModel?.result.add({'todo': newtask});
    toDoListModel?.total+=1;
    notifyListeners();
  }
}