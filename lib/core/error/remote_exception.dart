import 'package:equatable/equatable.dart';
import '../remote/error_model.dart';
class RemoteException extends Equatable implements Exception {

  final RemoteErrorModel errorModel;

  const RemoteException({
    required this.errorModel,
  });

  factory RemoteException.fromJson(Map<String, dynamic> json) {
    return RemoteException(
      errorModel: RemoteErrorModel.fromJson(json),
    );
  }

  RemoteException copyWith({
    RemoteErrorModel? errorModel,
  }) {
    return RemoteException(
      errorModel: errorModel ?? this.errorModel,
    );
  }
  
  @override
  List<Object?> get props => [errorModel];
}

