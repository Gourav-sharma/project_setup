import 'api_client.dart';
import 'response_model.dart';

class ApiRepository {
  late final String apiUrl;

  static late ApiClient _apiClient;

  static void init(String apiUrl) {
    ApiRepository().apiUrl = apiUrl;
    _apiClient = ApiClient(baseUrl: apiUrl);
  }



 static Future<ApiResponse> apiCall(String endpoint, RequestType requestType,
      {dynamic data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    final ApiResponse response = await _apiClient.request(
      endpoint,
      requestType: requestType,
      data: data,
      queryParameters: queryParameters,
      headers: headers,
    );

    if(response.statusCode != 200 && response.statusCode != 201){
      throw Exception(response.message);
    }

    return response;
  }
}

