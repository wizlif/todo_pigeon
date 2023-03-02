package io.wizlif.todo.todo_pigeon

import androidx.room.Database
import androidx.room.RoomDatabase
import io.wizlif.todo.todo_pigeon.todos.AppTodo
import io.wizlif.todo.todo_pigeon.todos.TodoDao

@Database(entities = [AppTodo::class], version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun todoDao(): TodoDao
}
