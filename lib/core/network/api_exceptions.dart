import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  factory ApiException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return ApiException(message: "Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ApiException(message: "Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ApiException(message: "Receive timeout in connection with API server");
      case DioExceptionType.sendTimeout:
        return ApiException(message: "Send timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ApiException(
          message: _handleError(dioError.response?.statusCode, dioError.response?.data),
          statusCode: dioError.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
        return ApiException(message: "Bad certificate");
      case DioExceptionType.connectionError:
        return ApiException(message: "Connection error");
      case DioExceptionType.unknown:
        return ApiException(message: "Unexpected error occurred");
    }
  }

  static String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error?['message'] ?? 'Bad request';
      case 401:
        return error?['message'] ?? 'Unauthorized';
      case 403:
        return error?['message'] ?? 'Forbidden';
      case 404:
        return error?['message'] ?? 'Not found';
      case 500:
        return error?['message'] ?? 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
