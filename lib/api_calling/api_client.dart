import 'dart:convert';

import 'package:dio/dio.dart';
import '../project_setup.dart';


class ApiClient {
  final Dio _dio;
  final String baseUrl;
  final Map<String, dynamic> headers;

  ApiClient({
    List<Interceptor>? interceptors,
    required this.baseUrl,
    required this.headers
  }) : _dio = Dio(BaseOptions(baseUrl: baseUrl)
     ) {
    _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
        request: true,
        logPrint: (object) {
          AppLogs.showInfoLogs(object.toString());
        }
    ));
    _dio.options.headers = headers;
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Future<ApiResponse> request(
      String endpoint, {
        required RequestType requestType,
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    try {
      Response response;
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(
            endpoint,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case RequestType.post:
          response = await _dio.post(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case RequestType.put:
          response = await _dio.put(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case RequestType.delete:
          response = await _dio.delete(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case RequestType.postMultipart:
          response = await _dio.post(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
      }
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Handles the response from the API.
  dynamic _handleResponse(Response response) {
    var json = jsonDecode(response.toString());
    return ApiResponse(data: response.data,message: json['message'],statusCode: json['statusCode']?? response.statusCode);
   // return ApiResponse(data: response.data,message: response.data['message'],statusCode: response.statusCode);
  }

  String _handleError(DioException error) {
    AppLogs.showErrorLogs("${error.response?.statusCode}");
    AppLogs.showErrorLogs("${error.type}");
    AppLogs.showErrorLogs("${error.message}");

   // var serverMessage = error.response?.data['message'] ?? error.message;

    var serverMessage = error.message??""; // Default to error.message

    if (error.response != null && error.response!.data != null) {
      if (error.response!.data is Map<String, dynamic>) {
        // If error.response.data is a Map, try to extract the message
        serverMessage = (error.response!.data as Map<String, dynamic>)['message'] ?? error.message;
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        serverMessage =  serverMessage.isNotEmpty?serverMessage : 'Connection timeout with API server';
        break;

      case DioExceptionType.sendTimeout:
        serverMessage =  serverMessage.isNotEmpty?serverMessage : 'Send timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        serverMessage =  serverMessage.isNotEmpty?serverMessage: 'Receive timeout with API server';
        break;

      case DioExceptionType.badResponse:
        serverMessage =  serverMessage.isNotEmpty?error.response?.statusCode==404?"Server Not Found":serverMessage : 'Received invalid status code: ${error.response?.statusCode}';
        break;
      case DioExceptionType.cancel:
        serverMessage =  serverMessage.isNotEmpty?serverMessage : 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionError:
        serverMessage =   'Connection error please check your network';
        break;
      case DioExceptionType.unknown:
        serverMessage =  serverMessage.isNotEmpty?serverMessage : 'Unknown error occurred';
        break;

      case DioExceptionType.badCertificate:
        serverMessage =  serverMessage.isNotEmpty?serverMessage : 'Bad certificate error occurred';
        break;


    }
    return serverMessage;
  }

}

enum RequestType { get, post, put, delete, postMultipart }