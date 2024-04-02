import 'package:error_handler/application/base_error.dart';
import 'package:error_handler/error_handler.dart';

extension ConvertToBaseError on HttpError {
  BaseError convertError(Type layer) {
    BaseError error = UnexpectedError();
    switch (this) {
      case NotFoundHttp():
        error = NotFoundError(message);
      case TimeoutHttp():
        error = TimeOutError(message);
      case ServerErrorHttp():
        error = UnexpectedError(message);
      case BadRequestHttp():
        error = InvalidDataError(message);
      case UnauthorizedHttp():
        error = InvalidCredentialsError(message);
      case ForbiddenHttp():
        error = UnauthorizedError(message);
      case InvalidDataHttp():
        error = InvalidDataError(message);
    }

    ErrorHandler.callBackHandler(
        '[$layer][${error.runtimeType}] ${message.isNotEmpty ? "- $message" : ""}');
    return error;
  }
}
