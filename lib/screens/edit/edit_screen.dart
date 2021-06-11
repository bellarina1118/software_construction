// TODO Complete the file edit_screen.dart
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//
//   1. Build the UI by composing from its components, i.e., Bar and Body.
//      Besides, you will also need to pass the 'states' to the components.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/screens/edit/bar.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'body.dart';

class EditScreen extends StatefulWidget {
  static Route route({isEditing, data}) => MaterialPageRoute(
      builder: (context) => EditScreen(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Todo _data;

  get isEditing => _isEditing;

  get data => _data;

  EditScreen({isEditing, data})
      : _isEditing = isEditing,
        _data = data;

  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  Todo _temp;

  void initState() {
    super.initState();
    _temp = Todo.copy(widget._data);
  }

  get temp => _temp;
  set temp(Todo value) => setState(() => _temp = value);

  @override
  Widget build(BuildContext context) {
    print(_temp.user);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(
            state: this,
          ),
          body: Body(state: this),
        ),
      ),
    );
  }
}
