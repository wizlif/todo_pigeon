import 'package:flutter/material.dart';
import 'package:todo_pigeon/todos/app_todo.dart';
import 'package:todo_pigeon/todos/todo_api.dart';

part 'parts/add_todo.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late final AppTodo todoPlugin;
  final _todos = <Todo>[];

  @override
  void initState() {
    super.initState();
    todoPlugin = AppTodo();

    todoPlugin.getTodos().then((value) {
      setState(() {
        _todos.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _todos.isEmpty
            ? const Center(
                child: Text('No Todos'),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  final todo = _todos[index];

                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.message),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: _todos.length,
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddTodoForm(addTodo: (title, message) async {
                  final todo = await todoPlugin.addTodo(title, message);
                  setState(() => _todos.insert(0, todo));

                  if (mounted) Navigator.of(context).pop();
                });
              });
        },
        label: const Text('Add Todo'),
        icon: const Icon((Icons.add)),
      ),
    );
  }
}
