import 'dart:async';
import 'dart:convert';

import 'package:flutter_test_app/data/entity/photo_item.dart';
import 'package:flutter_test_app/data/entity/todo_item.dart';
import 'package:http/http.dart' as http;

class Api {
  final String BASE_URL = "https://jsonplaceholder.typicode.com/";

  final String PHOTOS = "photos";
  final String TODOS = "todos/";

  Future<List<PhotoItem>> getPhotos() async {
    var response = await http.get(BASE_URL + PHOTOS);

    return (json.decode(response.body) as List)
        .map((i) => PhotoItem.fromJson(i))
        .toList();
  }

  Future<List<TodoItem>> getTodos() async {
    var response = await http.get(BASE_URL + TODOS);

    return (json.decode(response.body) as List)
        .map((i) => TodoItem.fromJson(i))
        .toList();
  }
}
