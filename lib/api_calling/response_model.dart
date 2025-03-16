class ApiResponse<T> {
  bool? isSuccess=true;
  T? data;
  String? message;
  int statusCode = 200;

  ApiResponse({
    bool? isSuccess,
    this.data,
    this.message,
    int? statusCode,
  }): isSuccess = isSuccess ?? true, statusCode = statusCode ?? 200;

  // You can use this for more detailed error logging or user messages
  @override
  String toString() {
    return 'ApiResponse{isSuccess: $isSuccess, data: $data, message: $message, statusCode: $statusCode}';
  }
}

class ApiErrorMessageException implements Exception {
  final String message;

  ApiErrorMessageException(this.message);

  @override
  String toString() => message; // Override toString to return only the message
}