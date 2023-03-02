import 'package:todo_pigeon/todos/todo_api.dart';
import 'package:todo_pigeon/todos/todo_platform_interface.dart';

class TodoPigeon implements TodoPlatform {
  final _api = TodoApi();

  @override
  Future<Todo> addTodo(String title, String message) {
    return _api.addTodo(title, message);
  }

  @override
  Future<void> deleteTodo(int id) {
    return _api.deleteTodo(id);
  }

  @override
  Future<Todo> getTodo(int id) {
    return _api.getTodo(id);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await _api.getTodos();
    return List.from(todos);
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    return _api.updateTodo(todo);
  }
}
