import '../remote/error_model.dart';

class RemoteException implements Exception {
  final RemoteErrorModel errorModel;

  RemoteException({
    required this.errorModel,
  });
}
