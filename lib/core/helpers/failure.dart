import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout. Please try again.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout. Please try again.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Invalid SSL certificate.');
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final message = _handleHttpError(statusCode);
        return ServerFailure(message);
      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection.');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error occurred. Please try again.');
    }
  }

  static String _handleHttpError(int? statusCode) {
    if (statusCode == null) return 'Unknown server error.';

    switch (statusCode) {
      case 400:
        return 'Bad request (400).';
      case 401:
        return 'Unauthorized request (401).';
      case 403:
        return 'Forbidden access (403).';
      case 404:
        return 'Requested resource not found (404).';
      case 500:
        return 'Internal server error (500).';
      case 503:
        return 'Service unavailable (503).';
      default:
        return 'Server error ($statusCode). Please try again.';
    }
  }
}
