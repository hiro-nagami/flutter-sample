import 'package:flutter/material.dart';
import 'package:todo/task-sample/component/list.dart';
import 'package:todo/task-sample/models/task.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskListView> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("タスクリスト"),
      ),
      body: TaskList(tasks),
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
