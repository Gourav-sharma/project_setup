import 'dart:convert';
import 'package:flutter/material.dart';
import '../project_setup.dart';

class CommonUtilMethods {

  static bool isValueEmpty(String value) {
    if (value.isEmpty) {
      return true;
    }
    return false;
  }

  static String isEmailValid(String email,{String? message}) {
    if(email.isEmpty){
      return emailValidationMessage;
    }else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return message??emailValidationMessage2;
    }
    return "";
  }

  static bool isPasswordValid(String password) {
    if (password.length < 8) {
      return false;
    }
    return true;
  }

  static bool isConfirmPasswordValid(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    if (phoneNumber.length != 10) {
      return false;
    }
    return true;
  }

  static bool isNameValid(String name) {
     if (name.length < 3) {
      return false;
    }
    return true;
  }

  static bool isDobValid(String dob) {
    final RegExp dobRegExp = RegExp(
      r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}$"
    );
    return dobRegExp.hasMatch(dob);
  }

  static showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.secondary,
      duration: duration,
    ));
  }


  static ThemeData manageTheme(bool isDarkTheme) {

    return isDarkTheme
        ? DarkTheme.theme
        : LightTheme.theme;
  }

  static createMultipartRequest({
    required bool isField,
    required bool isFile,
   //  required Map<String, dynamic> fieldJson
  }) async {
    String? imagePath = await ImagePickerHelper.pickImage(
        isMultiple: false
    );
    String path = imagePath??"";
    AppLogs.showInfoLogs(path);

    // final fieldData = fieldJson ?? {};
    final fieldData = {
      'name': 'John Doe',
      'age': 30,
    };
    final fileMap = {
      'key': 'profileImage',
      'path': path,
      'filename': path.split('/').last,
      'contentType': 'multipart/form-data',
    };

    final formData = await FormDataHelper().getRequestData(
      isField: isField,
      isFile: isFile,
      fieldData: fieldData,
      fileData: fileMap,
    );
    AppLogs.showMultipartRequestLogs(formData);
  }


static Future<bool> closeKeyboard(BuildContext context) async {
  if (FocusScope.of(context).hasFocus) {
    AppLogs.showInfoLogs("Keyboard closed");
    FocusScope.of(context).requestFocus(FocusNode());
  }
  //await Future.delayed(Duration(milliseconds: 100)); // Simulate async operation
  return !FocusScope.of(context).hasFocus;
}

static saveDataModelData(dynamic modelData){
    String data = jsonEncode(modelData);
    storage.write(SessionManagerKeys.model, data);
}

static Map<String, dynamic>? getModelData(){
    String? data = storage.read(SessionManagerKeys.model);
    if (data != null) {
      Map<String, dynamic> jsonData = jsonDecode(data);
      return jsonData;
    }
    return null;
}

}

