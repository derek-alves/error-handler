import 'package:error_handler/domain/domain_error.dart';

sealed class BaseError extends DomainError {
  BaseError([super.message]);
}

final class UnauthorizedError extends BaseError {
  UnauthorizedError([super.message]);
}

final class TimeOutError extends BaseError {
  TimeOutError([super.message]);
}

final class InvalidCredentialsError extends BaseError {
  InvalidCredentialsError([super.message]);
}

final class InvalidDataError extends BaseError {
  InvalidDataError([super.message]);
}

final class UnexpectedError extends BaseError {
  UnexpectedError([super.message]);
}

final class NotFoundError extends BaseError {
  NotFoundError([super.message]);
}

final class NoConnectionError extends BaseError {
  NoConnectionError([super.message]);
}
