// TODO Complete the file, edit/bar.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique:
//        a. The title bar will show accordingly: 'Edit a todo' or 'Add a new todo'
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'edit_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({state}) : _state = state;

  final EditScreenState _state;
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_state.widget.isEditing ? 'Edit a todo' : 'Add a new todo'),
      leading: Container(),
      centerTitle: true,
    );
  }
}
