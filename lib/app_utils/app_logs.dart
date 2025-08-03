import 'dart:developer';
import '../project_setup.dart';

class AppLogs {
  static void showLogs(String tag, String message) {
    if (kDebugMode) {
      log("$tag: $message");
    }
  }

  static void showApiSuccessLogs(String url,String message) {
    showLogs("$url----> SUCCESS:", message);
  }

  static void showApiErrorLogs(String url,String message) {
    showLogs("$url----> ERROR:", message);
  }

  static void showInfoLogs(String message) {
    showLogs("INFO", message);
  }

  static void showErrorLogs(String message) {
    showLogs("ERROR", message);
  }

  static void showWarningLogs(String message) {
    showLogs("WARNING", message);
  }

  static void showDebugLogs(String message) {
    showLogs("DEBUG", message);
  }


  static void showMultipartRequestLogs(FormData formData) {
    String logString = "MULTIPART_REQUEST: BODY:\n";

    for (var entry in formData.fields) {
      logString += "  Field: ${entry.key}, Value: ${entry.value}\n";
    }

    for (var entry in formData.files) {
      logString += "  File: ${entry.key}, Filename: ${entry.value.filename}, ContentType: ${entry.value.contentType}\n";
    }

    showLogs("MULTIPART_REQUEST", logString);
  }
}