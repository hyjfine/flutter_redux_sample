import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_app_redux/services/main.dart';

class TodoListRepository {
  static Future<Response> fetchTodoList() {
    return Services.rest.get('/api/v1/todo');
  }

  Future<Response> deleteTodoList(String id) {
    return Services.rest.delete('/api/v1/todo/$id');
  }

  Future<Response> postTodoList() {
    return Services.rest.post('/api/v1/todo/');
  }
}
