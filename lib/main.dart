// import 'dart:html';
import 'package:flutter/material.dart';
// import 'package:todo/component/grid.dart';
import 'package:todo/component/list.dart';
import 'package:todo/models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListView());
  }
}

// ignore: use_key_in_widget_constructors
class TodoListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoList();
}

class TodoList extends State<TodoListView> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("タスクリスト"),
      ),
      body: CountryList(tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          addTask("New task", "This task is new", false);
        }),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }

  void addTask(String title, String content, bool isDone) {
    setState(() {
      tasks.add(Task(title, content, isDone));
    });
  }
}
