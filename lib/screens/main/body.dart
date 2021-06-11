// TODO Complete the file, main/body.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with 'FutureBuilder' widget.
//      For todo items with the status has been 'done', they should be displayed
//      with the 'line through'. Otherwise, display it with normal text.
//
//   2. Perform the following operations:
//        a. Edit a todo - i.e., when the user tap a todo.
//           This operation will navigate to the '/edit' route.
//        b. Delete a todo - i.e. when the user long-press a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/models/user.dart';
import 'package:exercise3/services/todo_service.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'main_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final MainScreenState _state;

  @override
  Widget build(BuildContext context) {
    if (_state.login == true) {
      return FutureBuilder(
        future: TodoService.getTodoListByUser(_state.user.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // pass todo object list to list view widget
            return _widgetBody(snapshot.data.length, snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 25.0,
                width: 25.0,
              ),
            );
          }
        },
      );
    } else {
      return Container();
    }
  }

  Widget _widgetBody(int length, List list) {
    return ListView.separated(
      itemCount: length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text(list[index].title,
            style: TextStyle(
                decoration: list[index].done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)),
        subtitle: Text(list[index].description),
        onTap: () {
          _state.todo = list;
          Todo item = list[index];
          _state.updateTodo(index: index, item: item);
        },
        onLongPress: () {
          _state.todo = list;
          _state.removeTodo(list[index].id);
        },
      ),
    );
  }
}
