

import '../project_setup.dart';

class StorageManager {

  static const String isDarkMode = 'isDarkMode';
  static const String model = 'profile_setup_model';
  static const String loginModel = 'loginData';



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
