import 'package:flutter/material.dart';

class DataManager extends StatelessWidget {
  const DataManager({super.key});

  @override
  Widget build(BuildContext context) {
    // CountContainerにアクセスしてCountPageStateを取得している
    // final state = DatabaseContainer.of(context)?.state;

    // if (state == null) {
    //   return Container(
    //     margin: const EdgeInsets.all(3),
    //     child: const Text('count is nothing'));
    // }

    // // countUp, countDownをcallしてCountPageStateの値を変更する
    // return Center(
    //   child: Column(children: [
    //     const SizedBox(height: 50),
    //     Text('data: ${state.getTodoItems()}'),
    //     const SizedBox(height: 10),
    //     ElevatedButton(
    //       onPressed: () => state.createRow(), child: const Text("Create Data")),
    // ]));

    return Text('data: DataManager');
  }
}
