import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';

abstract class HomePagePresenter with ChangeNotifier, ErrorManagerPresenter {
  Future<void> authenticate(Map<String, dynamic> userCredential);
  Future<void> noConnectionError();
  Future<void> notFoundError();
  void increaseValue();
  void decreaseValue();
  int get counter;
}
