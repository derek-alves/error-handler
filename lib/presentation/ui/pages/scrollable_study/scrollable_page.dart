import 'package:flutter/material.dart';
import 'package:flutter_error_handling/presentation/ui/pages/scrollable_study/single_colum_row_page.dart';

class ScrollablePage extends StatelessWidget {
  const ScrollablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable study'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SingleColumRowPage())),
            child: const Text("Single Column Row"),
          )
        ]),
      ),
    );
  }
}
