import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider-and-notifier-sample/index.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BuildContextを経由してCountDataを取得している
    final countData = Provider.of<CountData>(context);

    // countUp, countDownをcallしてCountDataの値を変更する
    return Center(
        child: Column(children: [
      const SizedBox(height: 50),
      Text('count: ${countData.getCount()}'),
      const SizedBox(height: 10),
      ElevatedButton(
          onPressed: () => countData.countUp(), child: const Text("CountUp")),
      const SizedBox(height: 5),
      ElevatedButton(
          onPressed: () => countData.countDown(), child: const Text("CountDown"))
    ]));
  }
}
