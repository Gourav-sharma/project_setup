
import '../project_setup.dart';


class ApiClient {
  final Dio _dio;

  ApiClient._internal(this._dio);

  factory ApiClient({required String baseUrl, Map<String, dynamic>? headers}) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: headers ?? {"Content-Type": "application/json"},
    ));

    // ✅ Attach interceptors
    dio.interceptors.add(CustomInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    return ApiClient._internal(dio);
  }

  Future<ResponseModel<T>> request<T>({
    required String endpoint,
    required T Function(dynamic data) fromJson,
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.request(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
        ),
      );

      final responseData = response.data;

      return ResponseModel<T>(
        success: true,
        data: fromJson(responseData),
        message: responseData["message"], // ✅ auto-extract message
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException error) {
    AppLogs.showErrorLogs("${error.response?.statusCode}");
    AppLogs.showErrorLogs("${error.type}");
    AppLogs.showErrorLogs("${error.message}");


    var serverMessage ;

    if(error.response?.statusCode == 400 || error.response?.statusCode == 401 || error.response?.statusCode == 404){
      serverMessage = "Server Not Found";
    }else if(error.response?.statusCode == 403){
      serverMessage = error.message??"" ;
      StorageManager.clearStorage();
    }else{
      serverMessage = error.message??"" ;
    }

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


