pigeon:
	fvm flutter pub run pigeon \
	--input pigeons/todo_api.dart \
	--dart_out lib/todos/todo_api.dart \
	--experimental_kotlin_out ./android/app/src/main/kotlin/io/wizlif/todo/todo_pigeon/todos/Todo.kt \
	--experimental_kotlin_package "io.wizlif.todo.todo_pigeon.todos"
