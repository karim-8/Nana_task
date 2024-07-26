import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '/core/remote/remote_constants.dart';
import '/core/utils/remote_request_manager/remote_request_manager.dart';

class DioImplementation extends RemoteRequestManager {

  final Dio dio;

  DioImplementation(this.dio) {
    dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: RemoteConstants.baseUrl,
    );

    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //     request: true,
    //     responseBody: false,
    //     error: true,
    //     responseHeader: false,
    //     compact: true,
    //     maxWidth: 90,
    //   ),
    // );
  }


  @override
  Future post({
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (!isMultipart) 'Connection': 'keep-alive',
      if (!isMultipart) "Keep-Alive": "timeout=5, max=1000",
      if (token != null) 'Authorization': token
    };

    return await request(
      () async => await dio.post(
        url,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future get({
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (!isMultipart) 'Connection': 'keep-alive',
      if (!isMultipart) "Keep-Alive": "timeout=5, max=1000",
      if (token != null) 'Authorization': token
    };

    return await request(
      () async => await dio.get(
        url,
        queryParameters: query,
        cancelToken: cancelToken,
      ),
    );
  }
}

extension on DioImplementation {
  Future request(Future<Response> Function() request) async {
    try {
      final response = await request.call();
      return response;
    } on DioException catch (dioException) {
      log(name: 'DioException Message', "${dioException.message}");
      rethrow;
    } on Exception catch (exception) {
      log(name: 'Exception Type', "${exception.runtimeType}");
      log(name: 'Exception Message', "$exception");
    }
  }
}

