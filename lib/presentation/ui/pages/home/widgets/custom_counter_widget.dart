import 'package:flutter/material.dart';
import 'package:flutter_error_handling/domain/domain.dart';
import 'package:provider/provider.dart';

class CustomCounterWidget extends StatelessWidget {
  const CustomCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var presenter = Provider.of<HomePagePresenter>(context);

    return SizedBox.expand(
      child: Center(
        child: Text(
          presenter.counter.toString(),
          style: const TextStyle(fontSize: 35),
        ),
      ),
    );
  }
}
