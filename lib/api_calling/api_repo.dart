import 'package:get_storage/get_storage.dart';

import '../app_utils/app_logs.dart';
import 'api_client.dart';
import 'response_model.dart';

GetStorage storage = GetStorage();
// class ApiRepository {
//   late final String apiUrl;
//   static final Map<String, dynamic> headers = {};
//   static late ApiClient _apiClient;
//
//  static Future<void> storageInit() async {
//     await GetStorage.init();
//   }
//
//   static Future<void> init({required String apiUrl, required Map<String, dynamic> appHeaders}) async {
//     headers.addAll(appHeaders);
//     ApiRepository().apiUrl = apiUrl;
//     _apiClient = ApiClient(baseUrl: apiUrl, headers: headers);
//   }
//
//
//
//  static Future<ApiResponse> apiCall(String endpoint, RequestType requestType,
//       {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
//
//    final ApiResponse response = await _apiClient.request(
//       endpoint,
//       requestType: requestType,
//       data: data,
//       queryParameters: queryParameters,
//       headers: headers,
//     );
//
//     if(response.statusCode != 200 && response.statusCode != 201){
//       throw ApiErrorMessageException(response.message??"");
//     }
//
//     return response;
//   }
// }


class ApiRepository {
  static ApiRepository? _instance;
  final ApiClient apiClient;

  ApiRepository._internal(this.apiClient);

  /// 🔑 Init function for plugin users
  static Future<void> init({
    required String apiUrl,
    Map<String, dynamic>? appHeaders,
  }) async {
     await GetStorage.init();
    _instance = ApiRepository._internal(
      ApiClient(baseUrl: apiUrl, headers: appHeaders),
    );
  }

  /// 🔑 Get singleton instance
  factory ApiRepository() {
    if (_instance == null) {
      throw Exception(
        "ApiRepository not initialized. Call ApiRepository.init(apiUrl: ..., appHeaders: ...) first.",
      );
    }
    return _instance!;
  }

  // --- Methods ---
  Future<ResponseModel<T>> get<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    final ResponseModel<T> response = await apiClient.request<T>(
      endpoint: endpoint,
      method: 'GET',
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      AppLogs.showErrorLogs("checking error ${response}");
      throw ApiErrorMessageException(response.error??"");
    }
    return response;
  }

  Future<ResponseModel<T>> post<T>({
    required String endpoint,
    dynamic body,
    required T Function(dynamic) fromJson,
  }) async {
   final ResponseModel<T> response = await apiClient.request<T>(
      endpoint: endpoint,
      method: 'POST',
      body: body,
      fromJson: fromJson,
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      AppLogs.showErrorLogs("checking error ${response}");
      throw ApiErrorMessageException(response.error??"");
    }
    return response;

  }

  Future<ResponseModel<T>> put<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
    dynamic body,
  }) async {
    final ResponseModel<T> response = await apiClient.request<T>(
      endpoint: endpoint,
      method: 'PUT',
      body: body,
      fromJson: fromJson,
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      AppLogs.showErrorLogs("checking error ${response}");
      throw ApiErrorMessageException(response.error??"");
    }
    return response;
  }

  Future<ResponseModel<T>> delete<T>({
    required String endpoint,
    required T Function(dynamic) fromJson,
  }) async {
    final ResponseModel<T> response = await apiClient.request<T>(
      endpoint: endpoint,
      method: 'DELETE',
      fromJson: fromJson,
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      AppLogs.showErrorLogs("checking error ${response}");
      throw ApiErrorMessageException(response.error??"");
    }
    return response;
  }
}

