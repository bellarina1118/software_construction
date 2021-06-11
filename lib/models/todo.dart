// TODO Complete the model class Todo.
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
// Define the following methods:
//   a. all the getters and setters
//   b. the 'copy' constructor
//   c. the 'fromJson' constructor
//   d. the 'toJson' method
//-----------------------------------------------------------------------------------------------------------------------------
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Todo {
  @JsonKey(name: 'title')
  String _title;
  @JsonKey(name: 'description')
  String _description;
  @JsonKey(name: 'done')
  bool _done;
  @JsonKey(name: 'id')
  int _id;
  @JsonKey(name: 'user')
  int _user;

  Todo(
      {String title = '',
      String description = '',
      bool done = false,
      int id,
      int user})
      : _title = title,
        _description = description,
        _done = done,
        _id = id,
        _user = user;

  //getters and setters
  String get title => this._title;
  set title(String value) => _title = value;

  get description => _description;
  set description(value) => _description = value;

  get done => _done;
  set done(value) => _done = value;

  get id => _id;
  set id(value) => _id = value;

  get user => _user;
  set user(value) => _user = value;

  //copy constructor
  Todo.copy(Todo from)
      : this(
            title: from.title,
            description: from.description,
            done: from.done,
            id: from.id,
            user: from.user);

//fromJson constructor
  Todo.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title'],
            description: json['description'],
            done: json['done'],
            id: json['id'],
            user: json['user']);

//toJson method
  Map<String, dynamic> toJson() => {
        'title': _title,
        'description': _description,
        'done': _done,
        'id': _id,
        'user': _user,
      };
}
