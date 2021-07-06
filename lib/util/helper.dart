import 'package:http/http.dart' as http;

import 'holder.dart';

Future<http.Response> postCall(String service, Object? body, bool hasToken) async {
  final fixedHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Content-type": "application/json",
  };
  if(hasToken){
    var token = Holder.authToken;
    fixedHeaders["Authorization"] = 'Bearer $token';
  }
  return await http.post(Uri.parse('http://37.148.212.195:5000/$service'), headers: fixedHeaders, body: body);
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
  return await http.get(Uri.parse('http://37.148.212.195:5000/$service'), headers: fixedHeaders);
}
