package io.wizlif.todo.todo_pigeon.todos

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = TODO_TABLE)
data class AppTodo(
    @PrimaryKey(autoGenerate = true) val id: Int? = null,
    @ColumnInfo(name = "title") val title: String,
    @ColumnInfo(name = "message") val message: String,
    @ColumnInfo(name = "created_at") val createdAt: Long,
    @ColumnInfo(name = "updated_at") var updatedAt: Long? = null,
)

fun AppTodo.forApp(): Todo {
    return Todo(id?.toLong() ?: -1L, title, message, createdAt, updatedAt)
}

fun List<AppTodo>.forApp(): List<Todo> {
    return map { it.forApp() }
}

fun Todo.forPlugin(): AppTodo {
    return AppTodo(
        id.toInt(), title, message, createdAt, updatedAt,
    )
}

fun List<Todo>.forPlugin(): List<AppTodo> {
    return map { it.forPlugin() }
}


const val TODO_TABLE: String = "todos"
