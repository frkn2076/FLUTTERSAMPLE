import 'package:fluttersample/util/extensions.dart';
class LoginResponse {
  bool? isSuccess;
  String? errorMessage;
  String? token;

  LoginResponse({this.isSuccess, this.errorMessage, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json.getValue('IsSuccess');
    errorMessage = json.getValue('ErrorMessage');
    token = json.getValue('Token');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMessage'] = this.errorMessage;
    data['Token'] = this.token;
    return data;
  }
}