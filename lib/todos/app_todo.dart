import 'package:todo_pigeon/todos/todo_api.dart';
import 'package:todo_pigeon/todos/todo_platform_interface.dart';

import 'i_todo_api.dart';

class AppTodo implements ITodoApi {
  @override
  Future<Todo> addTodo(String title, String message) {
    return TodoPlatform.instance.addTodo(title, message);
  }

  @override
  Future<void> deleteTodo(int id) {
    return TodoPlatform.instance.deleteTodo(id);
  }

  @override
  Future<Todo> getTodo(int id) {
    return TodoPlatform.instance.getTodo(id);
  }

  @override
  Future<List<Todo>> getTodos() {
    return TodoPlatform.instance.getTodos();
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    return TodoPlatform.instance.updateTodo(todo);
  }
}
