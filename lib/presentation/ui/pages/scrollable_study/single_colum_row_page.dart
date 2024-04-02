import 'package:flutter/material.dart';

class SingleColumRowPage extends StatelessWidget {
  const SingleColumRowPage({super.key});

  Widget columnWidget([int size = 5]) => Column(
        children: List.generate(
          size,
          (index) => ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle),
            title: Text("text: $index"),
          ),
        ),
      );

  Widget rowWidget([int size = 5]) => Row(
        children: List.generate(
          size,
          (index) => SizedBox(
            height: (index % 2) == 0 ? 200 : 150,
            width: 180,
            child: Card(
              child: Center(child: Text('Dummy Card Text: $index')),
            ),
          ),
        ),
      );

  Widget singleChildBody() => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            columnWidget(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: rowWidget(),
            ),
            columnWidget(),
            columnWidget(),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Colum Child'),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: rowWidget(10),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [rowWidget()],
              ),
            ),
          ),
          SliverFillRemaining(
            child: PageView(
              children: [
                Container(
                  width: 200,
                  height: 300,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 300,
                  color: Colors.green,
                ),
                Container(
                  width: 200,
                  height: 300,
                  color: Colors.brown,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(child: columnWidget(10)),
          )
        ],
      ),
    );
  }
}
