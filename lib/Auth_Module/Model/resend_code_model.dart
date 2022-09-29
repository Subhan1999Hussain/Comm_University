class ResendModel {
  final int? status;
  final String? message;

  ResendModel({
    this.status,
    this.message,
  });

  ResendModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}