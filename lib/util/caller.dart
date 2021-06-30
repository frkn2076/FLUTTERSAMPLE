import 'package:fluttersample/models/baseresponse.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class API {
  static Future<BaseResponse> login(
      String language, String userName, String password) async {
        if(userName == "fbr" && password == "123")
          return BaseResponse(isSuccess: true, token: "dummytoken");
        else
          return BaseResponse(isSuccess: false, errorMessage: "dummyErrorMessage");

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
}
