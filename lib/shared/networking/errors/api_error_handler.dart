import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    // Log the error if needed: print(error); (optional for debugging)
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timed out. Please check your network connection or try again later.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Request sending took too long. Please ensure a stable connection and retry.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Server took too long to respond. Please try again later.");
      case DioExceptionType.badCertificate:
        return ServerFailure("The server's certificate is invalid. This might be due to network security settings. Please contact support if the issue persists.");
      case DioExceptionType.badResponse:
      // Handle bad response (e.g., 4xx, 5xx)
        if (error.response?.data is Map<String, dynamic>) {
          return ServerFailure.fromRes(error.response?.statusCode, error.response?.data);
        } else {
          return ServerFailure("Unexpected server response: ${error.response?.data ?? 'No additional information available.'}");
        }
      case DioExceptionType.cancel:
        return ServerFailure("The request was cancelled by the user or system. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure("Failed to connect to the server. Please check your internet connection or contact support.");
      case DioExceptionType.unknown:
        return ServerFailure("An unknown error occurred. Ensure you have a stable connection, or contact support if the problem continues.");
      default:
        return ServerFailure("An unexpected error occurred. Please try again or contact support for help.");
    }
  }

  factory ServerFailure.fromRes(int? statusCode, Map<String, dynamic> res) {
    if (statusCode == null) {
      return ServerFailure("Server response error: No status code received.");
    }

    switch (statusCode) {
      case 400:
        return ServerFailure(res["Message"] ?? "Bad request. Please check your input and try again.");
      case 401:
        return ServerFailure(res["Message"] ?? "Unauthorized access. Please check your credentials and log in.");
      case 403:
        return ServerFailure(res["Message"] ?? "Forbidden. You do not have permission to access this resource.");
      case 404:
        return ServerFailure("The requested resource was not found. Please check the URL or resource ID and try again.");
      case 500:
        return ServerFailure("The server encountered an internal error. Please try again later.");
      case 503:
        return ServerFailure("Service unavailable. The server might be down for maintenance. Please try again later.");
      default:
        return ServerFailure(res["Message"] ?? "An unexpected error occurred (HTTP $statusCode). Please try again.");
    }
  }
}
