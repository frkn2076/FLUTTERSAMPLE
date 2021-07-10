import 'package:http/http.dart' as http;

import 'holder.dart';

const String serverUrl = 'http://37.148.212.195:5000';

Future<http.Response> postCall(String service, Object? body, bool hasToken) async {
  final fixedHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Content-type": "application/json",
  };
  if(hasToken){
    var token = Holder.authToken;
    fixedHeaders["Authorization"] = 'Bearer $token';
  }
  return await http.post(Uri.parse('$serverUrl/$service'), headers: fixedHeaders, body: body);
}

Future<http.Response> getCall(String service, bool hasToken) async {
  final fixedHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Content-type": "application/json",
  };
  if(hasToken){
    var token = Holder.authToken;
    fixedHeaders["Authorization"] = 'Bearer $token';
  }
  return await http.get(Uri.parse('$serverUrl/$service'), headers: fixedHeaders);
}
