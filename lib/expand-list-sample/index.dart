import 'package:flutter/material.dart';

class ExpandListSample extends StatelessWidget {
  const ExpandListSample({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(title: const Text("Expand sample."));

    var items = Iterable<int>.generate(100).map((i) => ListTile(title: Text("List $i"))).toList();

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
            child: Text("Item List"),
          ),
          Expanded(child: ListView(
            children: items
          ))
        ],
      )
    );
  }

}