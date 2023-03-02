import 'package:pigeon/pigeon.dart';

class Todo {
  final int id;
  final String title;
  final String message;

  // Epoch
  final int createdAt;

  // Epoch
  final int? updatedAt;

  Todo(this.title, this.message, this.createdAt, this.updatedAt, this.id);
}

@HostApi()
abstract class TodoApi {
  @async
  List<Todo> getTodos();

  @async
  Todo getTodo(int id);

  @async
  Todo addTodo(String title, String message);

  @async
  Todo updateTodo(Todo todo);

  @async
  void deleteTodo(int id);
}
