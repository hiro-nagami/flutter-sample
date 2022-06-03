// import 'dart:html';
import 'package:flutter/material.dart';
// import 'package:todo/component/grid.dart';
import 'package:todo/task-sample/component/list.dart';
import 'package:todo/task-sample/index.dart';
import 'package:todo/task-sample/models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Samples',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskSample());
  }
}
