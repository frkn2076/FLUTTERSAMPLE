class LoginResponse {
  bool? isSuccess;
  String? errorMessage;
  String? token;

  LoginResponse({this.isSuccess, this.errorMessage, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    errorMessage = json['ErrorMessage'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['ErrorMessage'] = this.errorMessage;
    data['Token'] = this.token;
    return data;
  }
}