package io.wizlif.todo.todo_pigeon

import androidx.room.Room
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.wizlif.todo.todo_pigeon.todos.TodoApi
import io.wizlif.todo.todo_pigeon.todos.TodoPlugin

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val db = Room.databaseBuilder(
            applicationContext,
            AppDatabase::class.java, DATABASE
        ).allowMainThreadQueries()/*TODO: Use Threads or Coroutines*/
            .build()

        TodoApi.setUp(flutterEngine.dartExecutor.binaryMessenger, TodoPlugin(db.todoDao()))
    }

    companion object {
        const val DATABASE = "app_db"
    }
}
