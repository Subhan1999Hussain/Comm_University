class PasswordModel {
  final int? status;
  final String? message;

  PasswordModel({
    this.status,
    this.message,
  });

  PasswordModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}