class ResponseModel<T> {
  final bool success;
  final T? data;
  final String? error;
  final String? message;
  final int? statusCode;

  ResponseModel({
    required this.success,
    this.data,
    this.error,
    this.message,
    this.statusCode,
  });

  @override
  String toString() =>
      'ResponseModel(success: $success, data: $data, error: $error, message: $message, statusCode: $statusCode)';
}

class ApiErrorMessageException implements Exception {
  final String message;

  ApiErrorMessageException(this.message);

  @override
  String toString() => message; // Override toString to return only the message
}