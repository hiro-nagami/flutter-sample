import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider-and-notifier-sample/components/counter.dart';

class CountData extends ChangeNotifier {
  int _count = 0;

  countUp() {
    ++_count;
    notifyListeners();
  }

  countDown() {
    --_count;
    notifyListeners();
  }

  getCount() => _count;
}

class ProviderAndNotifierSample extends StatelessWidget {
  const ProviderAndNotifierSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountData>.value(
      value: CountData(),
      child: Scaffold(
          appBar: AppBar(),
          body: const Counter()
      )
    );
  }
}