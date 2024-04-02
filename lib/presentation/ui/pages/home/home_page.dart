import 'package:error_handler/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_error_handling/domain/domain.dart';
import 'package:provider/provider.dart';

import 'widgets/custom_counter_widget.dart';

class HomePage extends StatefulWidget {
  final HomePagePresenter presenter;
  const HomePage({
    super.key,
    required this.presenter,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ErrorManagerUi {
  late final List<Image> crashImages;
  @override
  void initState() {
    handleUIErrors(
      context,
      stream: widget.presenter.mainErrorStream,
    );

    super.initState();

    // crashImages = Iterable.generate(20)
    //     .map((i) => const Image(
    //           image: NetworkImage("file///:"),
    //         ))
    //     .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePagePresenter>(
      create: (context) => widget.presenter,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home page'),
        ),
        body: const CustomCounterWidget(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () async {
                await widget.presenter
                    .authenticate({'email': 'any', 'password': 'any'});
              },
              child: const Text('snack bar error'),
            ),
            ElevatedButton(
              onPressed: () async {
                await widget.presenter.noConnectionError();
              },
              child: const Text('nevegação error'),
            ),
            ElevatedButton(
              onPressed: () async {
                await widget.presenter.notFoundError();
              },
              child: const Text('Dialog error'),
            ),
          ],
        ),
      ),
    );
  }
}
