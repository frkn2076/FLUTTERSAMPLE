import 'package:fluttersample/models/baseresponse.dart';
import 'package:fluttersample/models/loginresponse.dart';
import 'package:fluttersample/models/todosresponse.dart';
import 'package:fluttersample/util/holder.dart';
import 'dart:convert';

import 'helper.dart';

Future<LoginResponse> login(String language, String userName, String password) async {
  final body = jsonEncode(<String, String>{
    'Language': language,
    'UserName': userName,
    'Password': password
  });
  final response = await postCall('account/login', body, false);
  if (response.statusCode == 200) {
    var responseModel = LoginResponse.fromJson(jsonDecode(response.body));
    if (responseModel.token != null){
      Holder.authToken = responseModel.token!;
    }
    return responseModel;
  } else {
    throw Exception('Failed to load login');
  }
}

Future<LoginResponse> register(String language, String userName, String password) async {
  final body = jsonEncode(<String, String>{
    'Language': language,
    'UserName': userName,
    'Password': password
  });
  final response = await postCall('account/register', body, false);
  print("a");
  if (response.statusCode == 200) {
    var responseModel = LoginResponse.fromJson(jsonDecode(response.body));
    if (responseModel.token != null){
      Holder.authToken = responseModel.token!;
    }
    return responseModel;
  } else {
    throw Exception('Failed to load register');
  }
}

Future<BaseResponse> addTodo(String language, String name, String description, String deadline, bool isCompleted) async {
  final body = jsonEncode(<String, Object>{
    'Language': language,
    'Name': name,
    'Description': description,
    'Deadline': deadline,
    'IsCompleted': isCompleted
  });
  final response = await postCall('todo/add', body, true);
  if (response.statusCode == 200) {
    return BaseResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load addTodo');
  }
}

Future<TodosResponse> getTodos() async {
  final response = await getCall('todo/getall', true);
  if (response.statusCode == 200) {
    return TodosResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load getTodo');
  }
}
