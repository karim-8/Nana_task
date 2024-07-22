import 'package:dio/dio.dart';

abstract class RemoteRequestManager {
  Future<dynamic> post({
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    bool isMultipart = false,
  });
}
