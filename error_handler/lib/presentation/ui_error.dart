import 'package:error_handler/application/base_error.dart';
import 'package:error_handler/domain/domain_error.dart';

sealed class UIError extends DomainError {
  UIError(String message) : super(message);
}

final class NoError extends UIError {
  NoError(String message) : super(message);
}

final class FiedError extends UIError {
  FiedError(String message) : super(message);
}

final class NoConnection extends UIError {
  NoConnection(String message) : super(message);
}

final class TimeOut extends UIError {
  TimeOut(String message) : super(message);
}

final class NotFound extends UIError {
  NotFound(String message) : super(message);
}

final class Timeout extends UIError {
  Timeout(String message) : super(message);
}

final class BadRequest extends UIError {
  BadRequest(String message) : super(message);
}

final class Unauthorized extends UIError {
  Unauthorized(String message) : super(message);
}

final class Forbidden extends UIError {
  Forbidden(String message) : super(message);
}

final class InvalidData extends UIError {
  InvalidData(String message) : super(message);
}

final class DefaultError extends UIError {
  DefaultError(String message) : super(message);
}

extension ConvertToUIError on BaseError {
  UIError toUiError() {
    return switch (this) {
      UnexpectedError() =>
        DefaultError(message.isEmpty ? 'Erro no servidor' : message),
      InvalidDataError() =>
        InvalidData(message.isEmpty ? 'Dados inválidos' : message),
      UnauthorizedError() =>
        Unauthorized(message.isEmpty ? 'Sem autorização' : message),
      TimeOutError() =>
        Timeout(message.isEmpty ? 'Tempo máximo de espera atingido' : message),
      InvalidCredentialsError() =>
        InvalidData(message.isEmpty ? 'Dados inválidos' : message),
      NotFoundError() =>
        NotFound(message.isEmpty ? 'Dados não encontrados' : message),
      NoConnectionError() =>
        NoConnection(message.isEmpty ? 'Sem conexão com a internet' : message),
    };
  }
}
