import 'package:error_handler/presentation/ui_error.dart';
import 'package:flutter/material.dart';

mixin ErrorManagerUi {
  void handleUIErrors(
    BuildContext context, {
    required Stream<UIError> stream,
    void Function(UIError error)? callback,
  }) {
    stream.listen((error) {
      if (callback != null) {
        callback(error);
        return;
      }

      if (error is DefaultError || error is InvalidData || error is Timeout) {
        final snackBar = SnackBar(
          content: Text(error.message),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }

      if (error is NotFound) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(error.message),
            content: Text(error.message),
          ),
        );

        return;
      }

      if (error is NoConnection) {
        Navigator.pushNamed(context, '/connection');
      }

      if (error is Unauthorized) {
        Navigator.pushNamed(context, '/unlogged');
      }
    });
  }
}
