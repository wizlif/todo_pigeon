package io.wizlif.todo.todo_pigeon.todos

import androidx.room.*

@Dao
interface TodoDao {
    @Query("SELECT * FROM $TODO_TABLE")
    fun getAll(): List<AppTodo>

    @Query("SELECT * FROM $TODO_TABLE WHERE id = :id LIMIT 1")
    fun findById(id: Int): AppTodo

    @Insert(onConflict = OnConflictStrategy.IGNORE)
    fun insert(todo: AppTodo): Long

    @Update
    fun update(todo: AppTodo)

    @Query("DELETE FROM $TODO_TABLE WHERE id = :id")
    fun delete(id: Int)
}
