import 'dart:async';

import 'package:error_handler/presentation/ui_error.dart';
import 'package:flutter/material.dart';

mixin ErrorManagerPresenter on ChangeNotifier {
  final _mainError = StreamController<UIError>();
  Stream<UIError> get mainErrorStream => _mainError.stream;
  void registerError(UIError error) => _mainError.add(error);
}
