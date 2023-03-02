import 'package:todo_pigeon/todos/todo_api.dart';

abstract class ITodoApi{
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);

  Future<Todo> addTodo(String title, String message);

  Future<Todo> updateTodo(Todo todo);

  Future<void> deleteTodo(int id);
}
