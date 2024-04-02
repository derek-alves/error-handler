library error_handler;

export 'extensions/http_convert_to_base_error.dart';
export 'infra/http_error.dart';
export 'presentation/presentation.dart';

class ErrorHandler {
  static void Function(String) _callBack = (_) {};

  static void init(void Function(String) callback) {
    _callBack = callback;
  }

  static void Function(String) get callBackHandler => _callBack;
}
