// TODO Complete the model class User.
//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
// Define the following methods:
//   a. the 'fromJson' constructor
//   b. the 'toJson' method
//-----------------------------------------------------------------------------------------------------------------------------
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int _id;
  @JsonKey(name: 'name')
  String _name;
  @JsonKey(name: 'photoUrl')
  String _photoUrl;
  @JsonKey(name: 'login')
  String _login;
  @JsonKey(name: 'password')
  String _password;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get photoUrl => _photoUrl;
  set photoUrl(value) => _photoUrl = value;

  get login => _login;
  set login(value) => _login = value;

  get password => _password;
  set password(value) => _password = value;

  User(
      {int id,
      String name = '',
      String photoUrl = '',
      String login = '',
      String password = ''})
      : _id = id,
        _name = name,
        _photoUrl = photoUrl,
        _login = login,
        _password = password;

  User.copy(User from)
      : this(
            id: from.id,
            name: from.name,
            photoUrl: from.photoUrl,
            login: from.login,
            password: from.password);

  //fromJson constructor
  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            photoUrl: json['photoUrl'],
            login: json['login'],
            password: json['password']);

//toJson method
  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
        'photoUrl': _photoUrl,
        'login': _login,
        'password': _password,
      };
}
