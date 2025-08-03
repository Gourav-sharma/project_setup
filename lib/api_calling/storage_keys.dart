

import '../project_setup.dart';

class StorageManager {
  static const String authToken = 'authToken';
  static const String accessToken = 'access_token';
  static const String fcmToken = 'fcmToken';
  static const String apiHeaders = 'apiHeaders';
  static const String userId = 'userId';
  static const String firebaseUserId = 'firebaseUserId';
  static const String oldUser = 'oldUser';
  static const String isLoggedIn = 'is_logged_in';
  static const String isNotificationsEnabled = 'isNotificationsEnabled';
  static const String isDarkMode = 'isDarkMode';
  static const String model = 'profile_setup_model';
  static const String loginModel = 'loginData';
  static const String chatId = 'chatId';
  static const String notificationType = 'notificationType';


  /// Save the model data to storage :::::::::::
  static saveDataModelData(dynamic modelData, String key) {
    String data = jsonEncode(modelData);
    storage.write(key, data);
  }

  /// Get the model data from storage :::::::::::
  static Map<String, dynamic>? getModelData(String key) {
    String? data = storage.read(key);
    if (data != null) {
      final Map<String, dynamic> decodedJson = json.decode(data);
      return decodedJson;
    } else {
      return null;
    }
  }

  /// Update a specific field in the model :::::::::::
  static void updateModelData(String key, String field, dynamic newValue) {
    Map<String, dynamic>? existingData = getModelData(key);
    if (existingData != null) {
      existingData[field] = newValue;
      saveDataModelData(existingData, key);
    }
  }

  /// Clear all data from storage
  static clearStorage() async {
    await storage.erase();
    storage.write(StorageManager.oldUser, true);
  }

  static void setHeaders({String? auth, String? token}) {

    Map<String, dynamic> headers = {
      'authorization': storage.read(StorageManager.authToken) ?? "",
      'Content-Type': 'application/json',
      'UtcOffsetInSecond': "19800",
      'AppVersion': '1',
      'DeviceTypeId': Platform.isIOS ? '2' : '1',
      'accessToken': storage.read(StorageManager.accessToken) ?? "",
      'LanguageCode': 'en',
    };
    String data = jsonEncode(headers);
    storage.write(apiHeaders, data);
  }

  static Map<String, dynamic>? getHeaders() {
    String? data = storage.read(StorageManager.apiHeaders);
    if (data != null) {
      final Map<String, dynamic> decodedJson = json.decode(data);

      return decodedJson;
    } else {
      return null;
    }
  }

  static Map<String, dynamic>? getLoginData() {
    String? data = storage.read(StorageManager.loginModel);
    if (data != null) {
      final Map<String, dynamic> decodedJson = json.decode(data);
      return decodedJson;
    } else {
      return null;
    }
  }

}
