import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_with_api/Providers/todolistprovider.dart';
class ToDoListWidget extends StatelessWidget {
   ToDoListWidget({super.key,required this.tasktitle});
String tasktitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tasktitle,style: TextStyle(
          color: Colors.blue),),
    );
  }
}
class addtask extends StatelessWidget {
   addtask({super.key});
  @override
  Widget build(BuildContext context) {
    String newtast = '';
    final object = Provider.of<ToDoListProvider>(context);
    return
      Column(
        children: [
          Text('Enter Your Task',style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 50,),
          TextFormField(
            onChanged: (text) {
              text = newtast;
            },
            decoration: InputDecoration(border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),hintText: 'Add Task'),
          ),
          SizedBox(height: 50,),
          ElevatedButton(onPressed: (){
            if(newtast.trim()!= ''){
              object.posttasks(newtast);
            }
            Navigator.pop(context);
          }, child: Text('Add'))
        ],
    );
  }
}
