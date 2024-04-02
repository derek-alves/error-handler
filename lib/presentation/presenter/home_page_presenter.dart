import 'package:error_handler/application/base_error.dart';
import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_error_handling/application/usecases/not_found_error_usecase.dart';

import '../../application/usecases/no_connection_usecase.dart';
import '../../domain/domain.dart';

class HomePagePresenterImpl extends ChangeNotifier
    with ErrorManagerPresenter
    implements HomePagePresenter {
  final AuthenticationUsecase authenticationUsecase;
  final NoConnectionUsecase noConnectionUsecase;
  final NotFoundErrorUsecase notFoundErrorUsecase;

  HomePagePresenterImpl({
    required this.authenticationUsecase,
    required this.noConnectionUsecase,
    required this.notFoundErrorUsecase,
  });
  int _counter = 20;

  @override
  int get counter => _counter;

  @override
  increaseValue() {
    _counter = _counter + 1;
    notifyListeners();
  }

  @override
  void decreaseValue() {
    if (_counter > 0) {
      _counter = _counter - 1;
      notifyListeners();
    }
  }

  @override
  Future<void> authenticate(Map<String, dynamic> userCredential) async {
    try {
      await authenticationUsecase.auth(
        AuthenticationParams.fromJson(userCredential),
      );
    } on BaseError catch (e) {
      registerError(e.toUiError());
    }
  }

  @override
  Future<void> noConnectionError() async {
    try {
      await noConnectionUsecase.auth(
        const AuthenticationParams(email: 'aaaa', password: 'bbbb'),
      );
    } on BaseError catch (e) {
      registerError(e.toUiError());
    }
  }

  @override
  Future<void> notFoundError() async {
    try {
      await notFoundErrorUsecase.auth(
        const AuthenticationParams(email: 'aaaa', password: 'bbbb'),
      );
    } on BaseError catch (e) {
      registerError(e.toUiError());
    }
  }
}
