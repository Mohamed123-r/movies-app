class ErrorModel {
  ErrorModel({this.statusCode, this.message, this.errors});

  ErrorModel.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    errors = json['errors'];
  }
  num? statusCode;
  String? message;
  dynamic errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    map['errors'] = errors;
    return map;
  }
}
