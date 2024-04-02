import 'package:flutter/material.dart';

class UnloggedPage extends StatelessWidget {
  const UnloggedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deslogado'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Deslogado',
            style: TextStyle(color: Colors.red, fontSize: 39),
          ),
        ],
      ),
    );
  }
}
