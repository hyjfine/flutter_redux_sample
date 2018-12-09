import 'package:dio/dio.dart';
import 'package:flutter_app_redux/services/main.dart';

class TodoDetailRepository {
  Future<Response> fetchTodo(String id) {
    return Services.rest.get('/api/v1/todo/$id');
  }
}
