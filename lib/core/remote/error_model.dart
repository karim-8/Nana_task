import 'package:equatable/equatable.dart';

class RemoteErrorModel extends Equatable {
  final String statusMessage;

  const RemoteErrorModel({
    required this.statusMessage,
  });

  factory RemoteErrorModel.fromJson(Map<String, dynamic> json) {
    return RemoteErrorModel(
      statusMessage: json['message'] ?? 'Sorry there is an error, Please try again!',
    );
  }

  @override
  List<Object> get props => [
        statusMessage,
      ];
}
