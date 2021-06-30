import 'package:fluttersample/models/baseresponse.dart';
import 'package:fluttersample/models/loginresponse.dart';
import 'package:fluttersample/models/todosresponse.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class API {
  static Future<LoginResponse> login(
      String language, String userName, String password) async {
    if (userName == "fbr" && password == "123")
      return LoginResponse(isSuccess: true, token: "dummytoken");
    else
      return LoginResponse(isSuccess: false, errorMessage: "dummyErrorMessage");

    // final response = await http.post(
    //     Uri.parse('http://127.0.0.1:3000/account/login'),
    //     headers: <String, String>{
    //       "Access-Control-Allow-Origin": "*",
    //       "content-type" : "application/json",
    //       "accept" : "application/json",
    //       "Access-Control-Allow-Methods": "POST"
    //     },
    //     body: jsonEncode(<String, String>{
    //       'Language': language,
    //       'UserName': userName,
    //       'Password': password
    //     }));

    // if (response.statusCode == 200) {
    //   return json
    //       .decode(response.body)
    //       .map<BaseResponse>((data) => BaseResponse.fromJson(data))
    //       .toList();
    // } else {
    //   throw Exception('Failed to load category');
    // }
  }

  static Future<LoginResponse> register(
      String language, String userName, String password) async {
    if (userName == "fbr" && password == "rrr")
      return LoginResponse(isSuccess: true, token: "dummytoken");
    else
      return LoginResponse(isSuccess: false, errorMessage: "dummyErrorMessage");
  }

  static Future<BaseResponse> addTodo(String name, String description, DateTime deadline, bool isCompleted) async {
      return BaseResponse(isSuccess: true, errorMessage: null);
  }

  static TodosResponse fetchTodos() {
      return TodosResponse(isSuccess: true, errorMessage: null, todos: [
        Todo(id: 1, name: "dummyname1", description: "dummydesc1", deadline: "adsa1", isCompleted: true),
        Todo(id: 2, name: "dummyname2", description: "dummydesc2", deadline: "adsa2", isCompleted: false),
        Todo(id: 3, name: "dummyname3", description: "dummydesc3", deadline: "adsa3", isCompleted: true)
      ]);
  }
}
