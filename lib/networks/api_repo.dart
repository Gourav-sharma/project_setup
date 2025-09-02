import '../project_setup.dart';

GetStorage storage = GetStorage();

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
      PrintLogs.showErrorLogs("checking error ${response}");
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
      PrintLogs.showErrorLogs("checking error ${response}");
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
      PrintLogs.showErrorLogs("checking error ${response}");
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
      PrintLogs.showErrorLogs("checking error ${response}");
      throw ApiErrorMessageException(response.error??"");
    }
    return response;
  }
}

