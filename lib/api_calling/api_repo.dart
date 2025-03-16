import 'package:get_storage/get_storage.dart';

import 'api_client.dart';
import 'response_model.dart';

GetStorage storage = GetStorage();
class ApiRepository {
  late final String apiUrl;
  static final Map<String, dynamic> headers = {};
  static late ApiClient _apiClient;

 static Future<void> storageInit() async {
    await GetStorage.init();
  }

  static Future<void> init({required String apiUrl, required Map<String, dynamic> appHeaders}) async {
    headers.addAll(appHeaders);
    ApiRepository().apiUrl = apiUrl;
    _apiClient = ApiClient(baseUrl: apiUrl, headers: headers);
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

