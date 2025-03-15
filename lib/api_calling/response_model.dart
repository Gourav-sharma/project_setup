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

  // Method to check if the response has an error
  bool get hasError => message != null || (statusCode >= 400);

  // You can use this for more detailed error logging or user messages
  @override
  String toString() {
    return 'ApiResponse{isSuccess: $isSuccess, data: $data, errorMessage: $message, statusCode: $statusCode}';
  }
}