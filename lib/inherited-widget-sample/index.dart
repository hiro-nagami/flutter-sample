import 'package:flutter/material.dart';
import 'package:todo/inherited-widget-sample/components/counter.dart';

class CountContainer extends InheritedWidget {
  const CountContainer({super.key, required this.state, required super.child});

  final CreatePageState state;

  @override
  bool updateShouldNotify(CountContainer old) {
    return true;
  }

  // CountContainerへ簡単にアクセスするためのインターフェース
  static CountContainer? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>();
}

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<StatefulWidget> createState() => CreatePageState();
}

class CreatePageState extends State<CountPage> {
  int _count = 0;

  // InheritedWidget経由でアクセスできる
  countUp() => setState(() => ++_count);

  countDown() => setState(() => --_count);

  getCount() => _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // CountContainerに内包されたウィジェットからアクセスできるようになる
        body: CountContainer(
            state: this,
            child: Scaffold(appBar: AppBar(), body: const Counter())));
  }
}