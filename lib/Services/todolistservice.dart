import 'package:dio/dio.dart';
import 'package:todolist_with_api/Models/todolistmodel.dart';

class ToDoListService{
  static Dio dio = Dio();
  static Future<ToDoListModel> getdata()async{
    try{
      Response response = await dio.get('https://dummyjson.com/todos/user/13');
      if(response.statusCode == 200){
        return ToDoListModel.fromjson(response.data);
      }else
        {
          throw Exception('Error');
        }
    }catch(s)
    {
      throw Exception(s);
    }
  }
  static Future<void> addtask(String newtask)async{
    await dio.post('https://jsonplaceholder.typicode.com/posts',
    data: {
      "todo": newtask,
      "completed": false,
      "userId": 13
    });
  }
}