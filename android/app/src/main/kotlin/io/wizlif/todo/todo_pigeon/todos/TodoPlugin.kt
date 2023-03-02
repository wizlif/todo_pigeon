package io.wizlif.todo.todo_pigeon.todos

import java.util.*

class TodoPlugin(private val dao: TodoDao) : TodoApi {

    override fun getTodos(callback: (Result<List<Todo>>) -> Unit) {
        val todos = dao.getAll()
        callback(Result.success(todos.forApp()))
    }

    override fun getTodo(id: Long, callback: (Result<Todo>) -> Unit) {
        val todo = dao.findById(id.toInt())
        callback(Result.success(todo.forApp()))
    }

    override fun addTodo(title: String, message: String, callback: (Result<Todo>) -> Unit) {
        val todo = AppTodo(title = title, message = message, createdAt = Date().time)
        val id = dao.insert(todo)
        val insertedTodo = dao.findById(id.toInt())

        callback(Result.success(insertedTodo.forApp()))
    }

    override fun updateTodo(todo: Todo, callback: (Result<Todo>) -> Unit) {
        val appTodo = todo.forPlugin()
        appTodo.updatedAt = Date().time

        dao.update(appTodo)

        val updatedTodo = dao.findById(todo.id.toInt())

        callback(Result.success(updatedTodo.forApp()))
    }

    override fun deleteTodo(id: Long, callback: (Result<Unit>) -> Unit) {
        dao.delete(id.toInt())
        callback(Result.success(Unit))
    }

}
