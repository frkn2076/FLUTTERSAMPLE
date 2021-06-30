class BaseResponse {
  bool? isSuccess;
  String? errorMessage;

  BaseResponse({this.isSuccess, this.errorMessage});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}