// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter_payment/core/errors/failure.dart';

// Failure handleDioError(DioException error) {
//   switch (error.type) {
//     case DioExceptionType.connectionTimeout:
//     case DioExceptionType.sendTimeout:
//     case DioExceptionType.receiveTimeout:
//       return const TimeoutFailure('Connection timed out.');
//     case DioExceptionType.badResponse:
//       final statusCode = error.response?.statusCode ?? 0;
//       if (statusCode >= 400 && statusCode < 500) {
//         if (statusCode == 401 || statusCode == 403) {
//           return const UnauthorizedFailure('Unauthorized access.');
//         }
//         return ServerFailure(
//           "Client error: ${error.response?.statusMessage ?? 'Unknown'}",
//         );
//       } else if (statusCode >= 500) {
//         return ServerFailure(
//           "Server error: ${error.response?.statusMessage ?? 'Unknown'}",
//         );
//       }
//       return UnknownFailure('Unexpected error: ${error.message}');
//     case DioExceptionType.cancel:
//       return const NetworkFailure('Request was cancelled.');
//     case DioExceptionType.unknown:
//       if (error.error is SocketException) {
//         return const NetworkFailure('No internet connection.');
//       }
//       return const UnknownFailure('Unknown error occurred.');
//     default:
//       return UnknownFailure('Unhandled error: ${error.message}');
//   }
// }
