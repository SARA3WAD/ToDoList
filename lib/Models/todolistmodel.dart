class ToDoListModel{
  List<dynamic> result;
  int total;
  ToDoListModel({required this.result,required this.total});
  factory ToDoListModel.fromjson(Map<String,dynamic> json){
    return ToDoListModel(result: json['todos'],total: json['total']);
  }
}