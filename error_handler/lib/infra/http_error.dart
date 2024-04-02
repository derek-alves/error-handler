import 'package:error_handler/domain/domain_error.dart';

sealed class HttpError extends DomainError {
  HttpError([String message = ""]) : super(message);
}

final class NotFoundHttp extends HttpError {
  NotFoundHttp([String message = ""]) : super(message);
}

final class TimeoutHttp extends HttpError {
  TimeoutHttp([String message = ""]) : super(message);
}

final class BadRequestHttp extends HttpError {
  BadRequestHttp([String message = ""]) : super(message);
}

final class UnauthorizedHttp extends HttpError {
  UnauthorizedHttp([String message = ""]) : super(message);
}

final class ForbiddenHttp extends HttpError {
  ForbiddenHttp([String message = ""]) : super(message);
}

final class InvalidDataHttp extends HttpError {
  InvalidDataHttp([String message = ""]) : super(message);
}

final class ServerErrorHttp extends HttpError {
  ServerErrorHttp([String message = ""]) : super(message);
}
