// "userId": 1,
// "id": 1,
// "title": "delectus aut autem",
// "completed": false

class TodoItem {
  int userId;
  int id;
  String title;
  bool completed;

  TodoItem.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];
}
