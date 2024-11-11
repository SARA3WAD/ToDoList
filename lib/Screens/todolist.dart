import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_api/Providers/todolistprovider.dart';
import 'package:todolist_with_api/Widgets/todolistwidget.dart';
class Todolist extends StatelessWidget {
  const Todolist({super.key});

  @override
  Widget build(BuildContext context) {
    var object = Provider.of<ToDoListProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Consumer<ToDoListProvider>(builder: (context, object, child) {
        final total = object.toDoListModel?.total;
        final res = object.toDoListModel?.result;
        if(res == null){
          object.getprovider();
          return Center(child: CircularProgressIndicator());
        }
        else{
          Container(child: Text('$total Tasks'));
          return ListView.builder(itemBuilder: (context, index) {
            return ToDoListWidget(tasktitle: res[index]['todo']);
          },itemCount: res.length,);
        }
      },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context) {
          return addtask();
        },);
      },child: Text('+'),),
    );
  }
}
