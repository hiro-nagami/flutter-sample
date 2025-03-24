import 'package:flutter/material.dart';
import 'package:todo/inherited-widget-sample/index.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

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
