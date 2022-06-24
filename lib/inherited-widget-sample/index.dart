import 'package:flutter/material.dart';

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

class CountPage extends StatefulWidget {
  const CountPage({Key? key}) : super(key: key);

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
    // CountContainerに内包されたウィジェットからアクセスできるようになる
    return CountContainer(
        state: this,
        child: Scaffold(appBar: AppBar(), body: const CounterWidget()));
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CountContainerにアクセスしてCountPageStateを取得している
    final state = CountContainer.of(context)?.state;

    if (state == null) {
      return Container(
          margin: const EdgeInsets.all(3),
          child: const Text('count is nothing'));
    }

    // countUp, countDownをcallしてCountPageStateの値を変更する
    return Center(
        child: Column(children: [
      const SizedBox(height: 50),
      Text('count: ${state.getCount()}'),
      const SizedBox(height: 10),
      ElevatedButton(
          onPressed: () => state.countUp(), child: const Text("CountUp")),
      const SizedBox(height: 5),
      ElevatedButton(
          onPressed: () => state.countDown(), child: const Text("CountDown"))
    ]));
  }
}
