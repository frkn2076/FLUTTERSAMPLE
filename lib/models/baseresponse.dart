import 'package:fluttersample/util/extensions.dart';
class BaseResponse {
  bool? isSuccess;
  String? errorMessage;

  BaseResponse({this.isSuccess, this.errorMessage});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json.getValue('IsSuccess');
    errorMessage = json.getValue('ErrorMessage');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}