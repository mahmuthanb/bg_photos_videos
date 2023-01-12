// Package imports:
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        String? message = err.response?.data?["errorMessage"];
        if (message != null) {
          throw BaseError(message, err.requestOptions);
        }
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        switch (err.runtimeType) {
          case SSLCertificateException:
            throw SSLCertificateException(err.requestOptions);

          default:
            throw NoInternetConnectionException(err.requestOptions);
        }
    }

    return super.onError(err, handler);
  }
}

class BaseError extends DioError {
  BaseError(this.text, RequestOptions r) : super(requestOptions: r);
  final String text;
  @override
  String toString() {
    return text;
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bilinmeyen bir hata oluştu, lütfen daha sonra tekrar deneyin.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'İnternet bağlantısı bulunamadı, tekrar deneyin.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bağlantı zaman aşımına uğradı.';
  }
}

class CancelException extends DioError {
  CancelException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Yetkisiz işlem.';
  }
}

class SSLCertificateException extends DioError {
  SSLCertificateException(RequestOptions r)
      : super(requestOptions: r, type: DioErrorType.other);

  @override
  String toString() {
    return 'Sertifika doğrulanamadı.';
  }
}
