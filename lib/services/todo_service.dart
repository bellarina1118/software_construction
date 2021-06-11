// TODO Complete the service class, TodoService
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following methods to handle REST calls about the Todo data
//    to the REST service.
//       a. getTodoListByUser: to get all the todos for a user (with given user id).
//       b. addTodo: to add a new todo.
//       c. updateTodo: to edit a todo.
//       d. removeTodo: to delete a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'rest.dart';
import '../models/todo.dart';

class TodoService {
  static Future<List<Todo>> getTodoListByUser(int userId) async {
    final List response = await Rest.get('todos?user=$userId'); //base path
    return response.map((json) => Todo.fromJson(json)).toList();
  }

  static Future<Todo> addTodo(Todo todo) async {
    final response = await Rest.post('todos', data: todo);
    return Todo.fromJson(response);
  }

  static Future<Todo> updateTodo(Todo todo) async {
    print('update title is: ' + todo.title);
    final response = await Rest.put('todos', data: todo);
    return Todo.fromJson(response);
  }

  static Future<void> removeTodo(Todo todo) async {
    final response = await Rest.delete('todos/${todo.id}');
    print(response);
  }
}
