class EmptyModel {
  final int status;
  final bool success;

  const EmptyModel({
    required this.status,
    required this.success,
  });

  factory EmptyModel.fromJson(Map<String, dynamic> json) {
    return EmptyModel(
      status: json['status'],
      success: json['success'],
    );
  }
}
