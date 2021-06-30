class LoginResponse {
  bool? isSuccess;
  String? errorMessage;
  String? token;

  LoginResponse({this.isSuccess, this.errorMessage, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['errorMessage'] = this.errorMessage;
    data['token'] = this.token;
    return data;
  }
}