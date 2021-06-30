class BaseResponse {
  final bool? isSuccess;
  final String? errorMessage;
  final String? token;

  BaseResponse({this.isSuccess, this.errorMessage, this.token});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        isSuccess: json['isSuccess'],
        errorMessage: json['errorMessage'],
        token: json['token']
    );
  }
}