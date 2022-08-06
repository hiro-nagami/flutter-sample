import 'package:flutter/material.dart';
import 'package:todo/inherited-widget-sample/components/counter.dart';

class CountContainer extends InheritedWidget {
  const CountContainer({Key? key, required this.state, required Widget child})
      : super(key: key, child: child);

  final CreatePageState state;

  @override
  bool updateShouldNotify(CountContainer old) {
    return true;
  }

  // CountContainerへ簡単にアクセスするためのインターフェース
  static CountContainer? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>();
}

class InheritedWidgetSample extends StatefulWidget {
  const InheritedWidgetSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CreatePageState();
}

class CreatePageState extends State<InheritedWidgetSample> {
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
