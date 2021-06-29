// import 'package:fluttersample/models/todomodel.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class API {
//   static Future<List<TodoModel>> fetchTodos() async {
//     final response = await http.get('http://dummy.restapiexample.com/api/v1/employees');

//     if (response.statusCode == 200) {
//       return json
//           .decode(response.body)['data']
//           .map<TodoModel>((data) => TodoModel.fromJson(data))
//           .toList();
//     } else {
//       throw Exception('Failed to load category');
//     }
//   }
// }


