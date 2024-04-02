import 'package:flutter/material.dart';
import 'package:flutter_error_handling/domain/domain.dart';
import 'package:provider/provider.dart';

enum FloatActionType { increate, decrease }

class FloatingButtonWidget extends StatelessWidget {
  final FloatActionType type;
  const FloatingButtonWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    var presente = Provider.of<HomePagePresenter>(context);
    return FloatingActionButton(
      onPressed: () => {
        type == FloatActionType.increate
            ? presente.increaseValue()
            : presente.decreaseValue()
      },
      child: Text(type == FloatActionType.increate ? "Increase" : "Decrease"),
    );
  }
}
